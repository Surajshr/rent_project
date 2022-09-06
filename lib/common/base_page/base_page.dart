import 'package:flutter/material.dart';
import 'package:rent_project/common/app_bar/custom_app_bar.dart';
import 'package:rent_project/core/constant/app_colors.dart';


class BasePage extends StatefulWidget {
  final Widget? title;
  final bool? showBackButton;
  final bool? showAppBar;
  final Widget? body;
  final Widget? leadingWidget;
  final List<Widget>? trailing;
  final double? appBarHeight;
  final double? elevation;
  final Color? colors;
  final String? navigate;

  BasePage(
      {Key? key,
        this.title,
        this.showBackButton,
        this.showAppBar,
        this.body,
        this.leadingWidget,
        this.trailing,
        this.appBarHeight,
        this.colors,
        this.elevation,
        this.navigate})
      : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,
      appBar: widget.showAppBar == false
          ? null
          : CustomAppBar(
        leadingWidget: widget.leadingWidget,
        elevation: widget.elevation,
        colors: widget.colors,
        title: widget.title ?? Text(""),
        showBackButton: widget.showBackButton,
        trailing: widget.trailing,
        height: widget.appBarHeight,
        navigate: widget.navigate,
      ),
      body: widget.body,
    );
  }
}
