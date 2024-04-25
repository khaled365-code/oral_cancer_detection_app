



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilis/colors.dart';

class CustomOutlinedTextField extends StatelessWidget {


  final String hintText;
  final TextStyle hintStyle;
  final double? width;
  final double? height;
  final Color? crusorColor;
  final void Function(String) onFieldSubmitted;
  final bool? obsecureText;
  final TextEditingController? controller;

  const CustomOutlinedTextField({super.key,this.controller, required this.hintText, required this.hintStyle, this.width, this.height, required this.crusorColor,required this.onFieldSubmitted, this.obsecureText=false});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 48.h,
      color: AppColors.str.withOpacity(.2),
      child: TextFormField(
        controller: controller,
        cursorColor: crusorColor,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r)
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r)

          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r)

          ),
        ),
      ),
    );
  }
}
