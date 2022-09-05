
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rent_project/core/constant/app_text_style.dart';
import 'package:rent_project/localization.dart';

class MemberConfirmation extends StatelessWidget {
 final  String title;
 final String pageName;
 final String routePath;

  const MemberConfirmation(
      {Key? key,
        required this.title,
        required this.pageName,
        required this.routePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyle.bodyTextStyle,
        children: <TextSpan>[
          TextSpan(
            text: getLocalizedString(context: context, resString: title),
            //style: AppTextStyle.normalBodyTextStyle,
          ),
          TextSpan(
              text: getLocalizedString(
                context: context,
                resString: pageName,
              ),
              style: AppTextStyle.urlTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, routePath);
                }),
        ],
      ),
    );
  }
}
