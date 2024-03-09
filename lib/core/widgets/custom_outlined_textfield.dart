



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';

class CustomOutlinedTextField extends StatelessWidget {


  final String hintText;
  final TextStyle hintStyle;
  final double? width;
  final double? height;
  final Color? crusorColor;
  final void Function(String) onFieldSubmitted;
  final bool? obsecureText;

  const CustomOutlinedTextField({super.key, required this.hintText, required this.hintStyle, this.width, this.height, required this.crusorColor,required this.onFieldSubmitted, this.obsecureText=false});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 48,
      color: AppColors.str.withOpacity(.2),
      child: TextFormField(
        cursorColor: crusorColor,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)

          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)

          ),
        ),
      ),
    );
  }
}
