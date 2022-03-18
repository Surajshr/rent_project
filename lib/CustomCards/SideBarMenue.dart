import 'package:flutter/material.dart';

class custumListTile extends StatelessWidget {
  custumListTile({required this.ListText,this.CustomOnTap,this.customChild});

  final String? ListText;
  final Widget? customChild;
  final Function()? CustomOnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: CustomOnTap,
      child: Container(
        child: customChild,


      ),
    );
  }
}
