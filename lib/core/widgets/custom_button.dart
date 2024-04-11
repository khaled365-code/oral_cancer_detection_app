import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key , required this.buttonText , this.onTap});

  String buttonText;
  VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:AppColors.background,
        ),
        width:220,
        height:55,
        child: Center(child: Text(buttonText,
          style:AppTextStyles.font20.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500),
        ),
        ),
      ),
    );
  }

}