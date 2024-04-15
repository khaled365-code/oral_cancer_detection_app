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
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(60.r),
              topLeft: Radius.circular(60.r),
            ),
          ),
        ),
        PositionedDirectional(
          top: -100.h,
          start: 40.w,
          end: 40.w,
          child:CustomFormContainer(
            borderRadius:BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r)),
            width: MediaQuery.of(context).size.width*0.8,
            height:MediaQuery.of(context).size.height,
            child: child!,
          ),
        ),
      ],
    );

  }
}