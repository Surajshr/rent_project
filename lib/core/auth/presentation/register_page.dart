import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_project/common/base_page/base_page.dart';
import 'package:rent_project/common/button/custom_button.dart';
import 'package:rent_project/common/textFirld/text_field.dart';
import 'package:rent_project/common/widget/member_conformation.dart';
import 'package:rent_project/core/auth/bloc/auth_bloc.dart';
import 'package:rent_project/core/auth/bloc/auth_events.dart';
import 'package:rent_project/core/auth/bloc/auth_states.dart';
import 'package:rent_project/core/constant/app_colors.dart';
import 'package:rent_project/core/constant/app_icons.dart';
import 'package:rent_project/core/constant/app_text_style.dart';
import 'package:rent_project/core/constant/image_constant.dart';
import 'package:rent_project/core/constant/res_string.dart';
import 'package:rent_project/helper/space.dart';
import 'package:rent_project/localization.dart';
import 'package:rent_project/routing/Routing.dart';
import 'package:rent_project/utils/image_utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _createAccountWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequestEvent(
            registerEmailController.text, registerPasswordController.text),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequestEvent());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BasePage(
      elevation: 0,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            Navigator.pushNamed(context, RoutingPath.dashboard);
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UnAuthenticatedState) {
            return generateForm(height, width, context);
          }
          return generateForm(height, width, context);
        },
      ),
    );
  }

  Column generateForm(double height, double width, BuildContext context) {
    return Column(
      children: [
        Center(
          child: ImageUtils.localImage(
              imgSource: ImageConstant.register,
              height: height * .25,
              width: width * .60),
        ),
        Text(
          getLocalizedString(context: context, resString: ResString.signUp),
          style: AppTextStyle.header,
        ),
        Text(
          getLocalizedString(
              context: context, resString: ResString.signUpMessage),
          textAlign: TextAlign.center,
          style: AppTextStyle.bodyTextStyle,
        ),
        space(),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                prefixIcon: AppIcons.emailIcon,
                label: ResString.email,
                hintText: ResString.email,
                fieldType: FieldType.email,
                controller: registerEmailController,
              ),
              CustomTextField(
                prefixIcon: AppIcons.passwordIcon,
                label: ResString.password,
                hintText: ResString.password,
                fieldType: FieldType.password,
                controller: registerPasswordController,
              ),
              space(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  color: AppColors.appThemeColor,
                  label: ResString.register,
                  onPressed: () {
                    _createAccountWithEmailAndPassword(context);
                  },
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: MemberConfirmation(
            pageName: ResString.signIn,
            routePath: RoutingPath.loginPage,
            title: ResString.haveAccount,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _authenticateWithGoogle(context);
              },
              child: ImageUtils.localImage(
                  imgSource: ImageConstant.google,
                  height: height * .09,
                  width: width * .09),
            ),
            space(width: 20),
            InkWell(
              onTap: () {},
              child: ImageUtils.localImage(
                  imgSource: ImageConstant.facebook,
                  height: height * .09,
                  width: width * .09),
            ),
          ],
        ),
      ],
    );
  }
}
