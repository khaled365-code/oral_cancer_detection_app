



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';

import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/widgets/body_app_bar.dart';
class FeedBackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Column(

        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 40.h, start: 15.w, end: 25.w),
            child: BodyAppBar(
              hasLeading: true,
              hasTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.cEFF0F3,
                          width: 2.w
                      )
                  ),
                  child: Icon(Icons.arrow_back_outlined, size: 20.sp,),
                ),
              ),
              title: Text('App Feedback', style: AppKhaledStyles.textStyle(
                  color: AppColors.black,
                  weight: FontWeight.bold,
                  size: 16),),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: Center(
                  child: ResuableText(text: 'howrate'.tr(context),
                    fontSize: 15,
                    color: AppColors.grgr,
                  )),
          ),
          SizedBox(
              height: 20.h,
            ),
          RatingBar.builder(
            initialRating: 1,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) =>
                Icon(
                  Icons.star_border_purple500_outlined,
                  size: 50,
                  color: AppColors.primary,),
            onRatingUpdate: (rating)
            {
              print(rating);
            },
          ),
            Padding(
              padding:EdgeInsetsDirectional.only(top: 10.h,start: 80.w, end: 75.w),
              child: Row(
                children: [
                  ResuableText(text: 'poor'.tr(context),
                    fontSize: 14,
                    color: AppColors.grgr,
                  ),
                  Spacer(),
                  ResuableText(text: 'excellent'.tr(context),
                    fontSize: 14,
                    color: AppColors.grgr,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 30.h,end: 12.w,start: 12.w),
              child: LineWidget(
                color: AppColors.grgr,
              ),
            ),//rating
            Padding(
              padding:EdgeInsetsDirectional.only(start: 20.w,top: 20.h,end: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResuableText(text: 'leavecomment'.tr(context),
                    fontSize: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ResuableText(text: 'impfeed'.tr(context),
                    fontSize: 14,
                    color: AppColors.grgr,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 20.h, end: 12.w, start: 12.w),
            child: LineWidget(
              color: AppColors.grgr,
            ),
          ),
        ],
        ),

    );

  }
}
