import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({super.key , required this.textState ,required this.onPressed,this.bIcon});

  final String textState;
  VoidCallback onPressed;
  final Icon? bIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton(

      onPressed:onPressed,
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            return AppColors.primary;
          },
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, 45.h),
        )

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textState ,
            style:AppTextStyles.font16.copyWith(
                color: AppColors.white,
               fontWeight: FontWeight.w500) ,
          ),
           SizedBox(width: 1.w),
          if (bIcon != null) bIcon!,



        ],
      ),
    );
  }
}