import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';

class NoSearchResultWidget extends StatelessWidget {
  const NoSearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414.w,
      height: 202.h,
      child: Column(
        children:
        [
          Padding(
            padding: EdgeInsets.only(top: 37.h),
            child: Center(
              child: ResuableText(
                  text: 'No new posts for you',
                fontSize: 20,
                color: AppColors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 14.h,start: 34.w,end: 34.w),
            child: ResuableText(
              text: 'It seems like there’s not a lot to show you right\n now, you can search above to find results',
              fontSize: 14,
              color: AppColors.cAFB8C1,
            ),
          ),


        ],
      ),
    );
  }
}
