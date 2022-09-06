import 'package:flutter/material.dart';
import 'package:rent_project/core/constant/app_colors.dart';
import 'package:rent_project/core/constant/app_icons.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool? showBackButton;
  final Widget? child;
  final Widget? leadingWidget;
  final List<Widget>? trailing;
  final double? height;
  final double? elevation;
  final Color? colors;
  final Widget? title;
  final String? navigate;

  CustomAppBar(
      {Key? key,
        this.title,
        this.showBackButton,
        this.child,
        this.leadingWidget,
        this.trailing,
        this.height,
        this.elevation,
        this.colors,
        this.navigate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: AppColors.appThemeColor),
      elevation: elevation ?? .5,
      backgroundColor: colors ?? AppColors.bgColor,
      title: title,
      leading: showBackButton == false
          ? leadingWidget != null
          ? leadingWidget
          : null
          : Builder(
        builder: (BuildContext context) => IconButton(
            onPressed: () {
              navigate != null
                  ? Navigator.pushNamed(context, navigate!)
                  : Navigator.pop(context);
            },
            icon: leadingWidget ?? AppIcons.backButton),
      ),
      actions: trailing,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
