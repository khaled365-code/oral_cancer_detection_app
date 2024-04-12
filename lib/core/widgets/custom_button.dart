import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key ,this.buttonTextColor, required this.buttonText , this.onTap,this.buttonBackground});

  String buttonText;
  VoidCallback? onTap;
  final Color? buttonBackground;
  final Color? buttonTextColor;


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:buttonBackground,
        ),
        width:220,
        height:55,
        child: Center(child: Text(buttonText,
          style:AppTextStyles.font20.copyWith(
              color: buttonTextColor,
              fontWeight: FontWeight.w500),
        ),
        ),
      ),
    );
  }

}