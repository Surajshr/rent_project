import 'package:flutter/material.dart';
import 'package:rent_project/common/base_page/base_page.dart';
import 'package:rent_project/common/button/custom_button.dart';
import 'package:rent_project/common/widget/member_conformation.dart';
import 'package:rent_project/core/constant/app_colors.dart';
import 'package:rent_project/core/constant/app_text_style.dart';
import 'package:rent_project/core/constant/image_constant.dart';
import 'package:rent_project/core/constant/res_string.dart';
import 'package:rent_project/helper/space.dart';
import 'package:rent_project/localization.dart';
import 'package:rent_project/routing/Routing.dart';
import 'package:rent_project/utils/image_utils.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return BasePage(
    showAppBar: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: ImageUtils.localImage(
                    imgSource: ImageConstant.landingPageImage, height: 300, width: 300),
              ),
              Text(
                getLocalizedString(
                    context: context, resString: ResString.welcomeTitle),
                style: AppTextStyle.header,
              ),
              Text(
                getLocalizedString(
                    context: context, resString: ResString.welcomeMessage),
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyTextStyle,
              ),
              CustomButton(
                  width: 200,
                  color: AppColors.appThemeColor,
                  label: ResString.owner,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutingPath.loginPage);
                  }),
              CustomButton(
                  width: 200,
                  color: AppColors.appThemeColor,
                  label: ResString.tenant,
                  onPressed: () {
                    Navigator.pushNamed(context, "");
                  }),
              space(
                height: height * .05,
              ),
              const MemberConfirmation(
                pageName: ResString.login,
                title: ResString.haveAccount,
                routePath: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
