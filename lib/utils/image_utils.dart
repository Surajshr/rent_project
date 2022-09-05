import 'package:flutter/material.dart';

class ImageUtils {
 static localImage({required String imgSource,double? height,double? width}) {
    return Image(
      image: AssetImage(imgSource),
      height: height??40,
      width:  width??40,
      fit: BoxFit.contain,
    );
  }
}
