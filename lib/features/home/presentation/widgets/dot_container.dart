

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

class DotContainer extends StatelessWidget {
  const DotContainer({super.key, required this.indicatorIsActive});

  final bool indicatorIsActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.w,
      height: 10.h,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: indicatorIsActive? AppColors.white:AppColors.cB3B3B3
      ),
    );
  }
}
