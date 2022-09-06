
import 'package:flutter/material.dart';
import 'package:rent_project/common/base_page/base_page.dart';
import 'package:rent_project/common/button/custom_button.dart';
import 'package:rent_project/core/constant/app_colors.dart';
import 'package:rent_project/core/constant/image_constant.dart';
import 'package:rent_project/core/constant/res_string.dart';
import 'package:rent_project/helper/space.dart';
import 'package:rent_project/localization.dart';
import 'package:rent_project/utils/image_utils.dart';

class ShowErrorPage extends StatefulWidget {
  const ShowErrorPage({Key? key}) : super(key: key);

  @override
  State<ShowErrorPage> createState() => _ShowErrorPageState();
}

class _ShowErrorPageState extends State<ShowErrorPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageUtils.localImage(imgSource: ImageConstant.error,
                height: 300, width: 200, ),
            Text(getLocalizedString(
                context: context, resString: ResString.pageNotFountMessage)),
            space(),
            CustomButton(
                color: AppColors.appThemeColor,
                width: MediaQuery.of(context).size.width / 2,
                label: ResString.goBack,
                onPressed: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
