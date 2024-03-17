import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({super.key , required this.textState ,required this.onPressed,this.bIcon});

  final String textState;
  VoidCallback onPressed;
  final Icon? bIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:onPressed,
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            return AppColors.primary;
          },
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
        ),

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8,vertical:4),
        child: Row(
          children: [
            Text(textState ,
              style:AppTextStyles.font16.copyWith(
                  color: AppColors.white,
                 fontWeight: FontWeight.w500) ,
            ),
            const SizedBox(width: 4),
            if (bIcon != null) bIcon!,
            const SizedBox(width: 4),


          ],
        ),
      ),
    );
  }
}