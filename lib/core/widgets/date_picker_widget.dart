
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilis/colors.dart';

class CustomDatePicker extends StatelessWidget {
  final Widget child;
  const CustomDatePicker({super.key,required this.child});

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 327.w,
      height: 48.h,
      color: AppColors.str.withOpacity(.2),
      child: child,
    );

  }
}

