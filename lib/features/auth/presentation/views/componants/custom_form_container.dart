import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/colors.dart';

class CustomFormContainer extends StatelessWidget {
  const CustomFormContainer({super.key,this.backGroundColor, this.borderRadius,required this.child,this.height,this.width});

  final Widget child;
  final double? width;
  final double? height;
  final Color? backGroundColor;
   final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color:backGroundColor?? AppColors.primary,
          borderRadius: borderRadius,
          border: Border.all(
              color: Colors.white,
              width: 4.0.w,)
        ),
        child: child,
      ),
    );
  }
}
