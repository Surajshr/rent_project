import 'package:flutter/material.dart';
import 'package:rent_project/core/constant/app_text_style.dart';
showConfirmDialog(BuildContext ctx, title, content,{ List<Widget>? actions}) {
  return showDialog(
      context: ctx,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title, style: AppTextStyle.title,),
          content: content,
          actions:
          actions ??
              [
                ElevatedButton(
                    child: const Text('ok'),
                    onPressed: () {

                      Navigator.pop(ctx);
                    })
              ],
        );
      });
}
