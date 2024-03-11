import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

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
          color:AppColors.primary,
        ),
        width:308,
        height:58,
        child: Center(child: Text(buttonText,
          style:const TextStyle(color: Colors.white,fontSize: 20),
        ),
        ),
      ),
    );
  }

}