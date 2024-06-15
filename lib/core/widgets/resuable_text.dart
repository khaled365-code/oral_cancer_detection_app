

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilis/app_khaled_styles.dart';
import '../utilis/app_colors.dart';

class ResuableText extends StatelessWidget {
  const ResuableText({super.key, required this.text, this.color, this.fontSize, this.fontWeight, this.textDecoration, this.maxLines, this.textOverflow});

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: maxLines??null,
      overflow: textOverflow??null,
      style: AppKhaledStyles.textStyle(
          decoration: textDecoration??null,
          color: color ??AppColors.black,
          size: (fontSize?? 15).sp,
          weight: fontWeight ?? FontWeight.w400
      ),);
  }
}
