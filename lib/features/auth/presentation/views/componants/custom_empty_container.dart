import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_container.dart';

class EmptyContainer extends StatelessWidget{
  const EmptyContainer({super.key,this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width:ScreenUtil().screenWidth,
          height:ScreenUtil().screenHeight,
          decoration:const  BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(60),
              topLeft: Radius.circular(60),
            ),
          ),
        ),
        PositionedDirectional(
          top: -100,
          start: 40,
          end: 40,
          child:CustomFormContainer(
            borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)),
            width: 720.w,
            height:620.h,
            child: child!,
          ),
        ),
      ],
    );

  }
}