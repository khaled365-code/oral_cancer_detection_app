

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/widgets/body_app_bar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Padding(
            padding:  EdgeInsetsDirectional.only(top: 40.h,start: 15.w,end: 25.w),
            child: BodyAppBar(
              hasLeading: true,
              hasTitle: true,
              leading: GestureDetector(
                onTap: ()
                {
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
                  child: Icon(Icons.arrow_back_outlined,size: 20.sp,),
                ),
              ) ,
              title: Text('Terms & Conditions',style: AppKhaledStyles.textStyle(color: AppColors.black,weight: FontWeight.bold,size: 15.sp),),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 30.h,start: 24.w),
            child: ResuableText(text: 'Text title',fontSize: 17,fontWeight: FontWeight.w700,color: AppColors.primary,) ,
    ),
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
            child: Container(
              width: 352.w,
              height: 63.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:
                  [
                    Padding(
                      padding:  EdgeInsets.only(top: 5.h),
                      child: Image.asset(ImageConstants.roundPointCommunityImage),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Text('This text is an example of text that can be replaced in the same space',
                      style: AppKhaledStyles.textStyle(
                        size: 14,
                        weight: FontWeight.w400,
                        color: AppColors.c8A8A8A
                      ),),
                    )
                  ]

              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
            child: Container(
              width: 352.w,
              height: 63.h,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:
                  [
                    Padding(
                      padding:  EdgeInsets.only(top: 5.h),
                      child: Image.asset(ImageConstants.roundPointCommunityImage),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Text('This text is an example of text that can be replaced in the same space',
                        style: AppKhaledStyles.textStyle(
                            size: 14,
                            weight: FontWeight.w400,
                            color: AppColors.c8A8A8A

                        ),),
                    )
                  ]

              ),
            ),
          ),


          Padding(
            padding: EdgeInsetsDirectional.only(top: 20.h,start: 24.w),
            child: ResuableText(text: 'Text title',fontSize: 17,fontWeight: FontWeight.w700,color: AppColors.primary,) ,
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
            child: Container(
              width: 352.w,
              height: 63.h,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:
                  [
                    Padding(
                      padding:  EdgeInsets.only(top: 5.h),
                      child: Image.asset(ImageConstants.roundPointCommunityImage),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Text('This text is an example of text that can be replaced in the same space',
                        style: AppKhaledStyles.textStyle(
                            size: 14,
                            weight: FontWeight.w400,
                            color: AppColors.c8A8A8A

                        ),),
                    )
                  ]

              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
            child: Container(
              width: 352.w,
              height: 63.h,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:
                  [
                    Padding(
                      padding:  EdgeInsets.only(top: 5.h),
                      child: Image.asset(ImageConstants.roundPointCommunityImage),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Text('This text is an example of text that can be replaced in the same space',
                        style: AppKhaledStyles.textStyle(
                            size: 14,
                            weight: FontWeight.w400,
                            color: AppColors.c8A8A8A

                        ),),
                    )
                  ]

              ),
            ),
          ),


          Padding(
            padding: EdgeInsetsDirectional.only(top: 20.h,start: 24.w),
            child: ResuableText(text: 'Text title',fontSize: 17,fontWeight: FontWeight.w700,color: AppColors.primary,) ,
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
            child: Container(
              width: 352.w,
              height: 63.h,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:
                  [
                    Padding(
                      padding:  EdgeInsets.only(top: 5.h),
                      child: Image.asset(ImageConstants.roundPointCommunityImage),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Text('This text is an example of text that can be replaced in the same space',
                        style: AppKhaledStyles.textStyle(
                            size: 14,
                            weight: FontWeight.w400,
                            color: AppColors.c8A8A8A

                        ),),
                    )
                  ]

              ),
            ),
          ),


        ],

      ),



    );
  }
}
