

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilis/app_styles.dart';
import '../utilis/colors.dart';

class ResuableText extends StatelessWidget {
  const ResuableText({super.key, required this.text, this.color, this.fontSize, this.fontWeight});

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: AppKhaledStyles.textStyle(
          color: color ??AppColors.black,
          size: (fontSize?? 15).sp,
          weight: fontWeight ?? FontWeight.w400
      ),);
  }
}
