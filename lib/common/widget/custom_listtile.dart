import 'package:flutter/material.dart';
import 'package:rent_project/core/constant/app_icons.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {this.title, this.leading,this.onPress, this.trailing, this.subTitle});

  final Widget? leading;
  final Widget? trailing;
  final Function()? onPress;
  final Widget? title;
  final Widget? subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: leading ?? AppIcons.defaultIcon,
      title: title ?? Text("List Tile"),
      trailing: trailing,
      subtitle: subTitle ?? null,
    );
  }
}
