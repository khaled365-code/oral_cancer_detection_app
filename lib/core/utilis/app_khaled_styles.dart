import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';



class AppKhaledStyles {
  static TextStyle textStyle({
    Color? color,
    Color? decorationColor,
    double? size,
    String? family,
    FontWeight? weight,
    TextDecoration? decoration,
    List<Shadow>? shadow,
    double height = 1.3,
    bool? isItalic = false,
  }) {
    return TextStyle(
      inherit: false,
       color: color ?? AppColors.black,
      fontSize: (size ?? 14).sp,
      fontFamily: family ?? 'Helvetica',
      fontWeight: weight ?? FontWeight.w400,
      height: height,
      fontStyle: isItalic! ? FontStyle.italic : null,
      decoration: decoration,
      shadows: shadow,
      decorationColor: decorationColor,

    );
  }
}


