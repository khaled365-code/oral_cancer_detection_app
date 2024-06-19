import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

class CustomQuestionContainer extends StatelessWidget {
  const CustomQuestionContainer({super.key,this.backGroundColor, this.borderRadius,required this.child,this.height,this.width, this.image});

  final Widget child;
  final double? width;
  final double? height;
  final Color? backGroundColor;
  final BorderRadiusGeometry? borderRadius;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: image!,fit: BoxFit.fill),
            color:backGroundColor?? AppColors.primary,
            borderRadius: borderRadius,
            border: Border.all(
              color: AppColors.primary,
              width: 2.0.w,)
        ),
        child: child,
      ),
    );
  }
}
