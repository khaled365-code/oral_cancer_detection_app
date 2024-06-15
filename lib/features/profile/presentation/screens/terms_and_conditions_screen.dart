

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/widgets/body_app_bar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
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
                    title: Text('Terms & Conditions',style: AppKhaledStyles.textStyle(color: AppColors.black,weight: FontWeight.bold,size: 16),),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 20.h,start: 24.w),
                  child: ResuableText(text: 'Medical Disclaimer',fontSize: 17,fontWeight: FontWeight.w700,color: AppColors.primary,) ,
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
                  child: Container(
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
                            child: Text('The content provided in this app, including but not limited to text, images, and information, is for informational purposes only. It is not intended to replace professional medical advice, diagnosis, or treatment',
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
                            child: Text('Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition',
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
                  child: ResuableText(text: 'Limitation of Liability',fontSize: 17,fontWeight: FontWeight.w700,color: AppColors.primary,) ,
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
                  child: Container(
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
                            child: Text('MouthHealth Sentinel is not liable for any direct, indirect, incidental, or consequential damages arising out of the use or inability to use the app',
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
                            child: Text('even if we have been advised of the possibility of such damages',
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
                  child: ResuableText(text: 'Community Guidelines',fontSize: 17,fontWeight: FontWeight.w700,color: AppColors.primary,) ,
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
                  child: Container(

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
                            child: Text('When participating in the community features of the app, users must adhere to respectful and constructive behavior',
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
                            child: Text('Harassment, discrimination, or any form of abuse will not be tolerated and may result in suspension or termination of access',
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
                  child: ResuableText(text: 'Modifications to Terms',fontSize: 17,fontWeight: FontWeight.w700,color: AppColors.primary,) ,
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
                  child: Container(

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
                            child: Text('We reserve the right to modify these Terms and Conditions at any time',
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
                            child: Text('Changes will be effective immediately upon posting. Continued use of the app after any modifications constitutes acceptance of the new terms',
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
                  child: ResuableText(text: 'User Responsibilities',fontSize: 17,fontWeight: FontWeight.w700,color: AppColors.primary,) ,
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
                  child: Container(

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
                            child: Text('Users are responsible for providing accurate and up-to-date information when using the app',
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
                            child: Text('Misuse of the app or providing false information may result in termination of access',
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
                  child: ResuableText(text: 'Intellectual Property',fontSize: 17,fontWeight: FontWeight.w700,color: AppColors.primary,) ,
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 13.w,end: 10.w),
                  child: Container(

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
                            child: Text('All content within the app, including text, graphics, logos, and software, is the property of OralHealth Sentinel and is protected by intellectual property laws',
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
                            child: Text('Unauthorized use of any content is prohibited',
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
                SizedBox(height: 20.h,),


              ],

            ),
          ),
        ],
      ),



    );
  }
}
