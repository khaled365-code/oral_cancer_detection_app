

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';

class RetweetBottomSheet extends StatelessWidget {
  const RetweetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414.w,
      height: 235.h,
      color: AppColors.white,
      child: Column(
        children: [
          Padding(
          padding:  EdgeInsetsDirectional.only(start: 24.w,top: 38.h),
          child: Row(
            children: [
              Image.asset(ImageConstants.retweetImage),
              SizedBox(width: 20.w,),
              ResuableText(
                  text: 'Retweet',
                color: AppColors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 24.w,top: 40.h),
            child: Row(
              children: [
                Image.asset(ImageConstants.penCommunityImage),
                SizedBox(width: 20.w,),
                ResuableText(
                  text: 'Report Offensive Content',
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsetsDirectional.only(bottom: 42.h,start:8.w,end: 8.w),
            child: Container(
              width: 398.w,
              height: 48.h,
              decoration: BoxDecoration(
                  color: AppColors.cE7ECF0,
                  borderRadius: BorderRadius.circular(25.r)
              ),
              child: Center(
                child: ResuableText(
                    text: 'Cancel',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
