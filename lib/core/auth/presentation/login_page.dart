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

class NewLoginPage extends StatefulWidget {
  const NewLoginPage({Key? key}) : super(key: key);

  @override
  State<NewLoginPage> createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequestEvent(emailController.text, passwordController.text),
      );
      print(emailController.text);
      print(passwordController.text);
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BasePage(
      showAppBar: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            Navigator.pushNamed(context,RoutingPath.dashboardPage);
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
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
      ),
    );
  }

  Column generateForm(double height, double width, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: ImageUtils.localImage(
              imgSource: ImageConstant.login,
              height: height * .30,
              width: width * .70),
        ),
        Text(
          getLocalizedString(context: context, resString: ResString.loginTitle),
          style: AppTextStyle.header,
        ),
        Text(
          getLocalizedString(
              context: context, resString: ResString.loginMessage),
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
                controller: emailController,
              ),
              CustomTextField(
                prefixIcon: AppIcons.passwordIcon,
                label: ResString.password,
                hintText: ResString.password,
                fieldType: FieldType.password,
                controller: passwordController,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      getLocalizedString(
                          context: context,
                          resString: ResString.forgetPassword),
                      style: AppTextStyle.urlTextStyle,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
              space(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  color: AppColors.appThemeColor,
                  label: ResString.login,
                  onPressed: () {
                    _authenticateWithEmailAndPassword(context);
                  },
                ),
              ),
            ],
          ),
        ),
        space(height: height * .10),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: MemberConfirmation(
            pageName: ResString.register,
            routePath: RoutingPath.register,
            title: ResString.registerMessage,
          ),
        ),
      ],
    );
  }
}
