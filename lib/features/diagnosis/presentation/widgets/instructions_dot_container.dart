



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

class InstructionsDotContainer extends StatelessWidget {
  const InstructionsDotContainer({super.key, required this.indicatorIsActive});

  final bool indicatorIsActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.w,
      height: 8.h,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: indicatorIsActive==true? AppColors.primary:AppColors.cB3B3B3
      ),
    );
  }
}
