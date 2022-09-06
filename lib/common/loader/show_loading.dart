import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
}
