


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/custom_app_bar.dart';
import '../../../../core/widgets/resuable_text.dart';
import '../widgets/line_widget.dart';
import '../widgets/no_search_result_widget.dart';

class NoPostsScreen extends StatelessWidget {
  const NoPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: PreferredSize(
         preferredSize: Size(double.infinity, 40.h),
         child: DefaultAppBar(
           leading: Padding(
             padding: EdgeInsetsDirectional.only(start: 20.w),
                child: Center(
                 child: Stack(
                   children: [
                     Image.asset(ImageConstants.roundPostTwitter),
                     PositionedDirectional(
                         start: 18.w,
                         child: Image.asset(ImageConstants.roundPointCommunityImage))
                   ],
                  ),
               )),
           title: Container(
        width: 286.w,
        height: 32.h,
        decoration: BoxDecoration(
            color: AppColors.cE7ECF0,
            borderRadius: BorderRadius.circular(25.r)
        ),
        child: Expanded(
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsetsDirectional.only(start:20.w,bottom: 6.h,top: 6.h),
                hintText: 'Search Posts',
                hintStyle: AppKhaledStyles.textStyle(
                  color: AppColors.cAFB8C1,
                  size: 13,
                )
            ),
          ),
        ),
      ),
           actions:
             [
               Padding(
                 padding:  EdgeInsetsDirectional.only(end: 11.5.w),
                 child: GestureDetector(
                     onTap: ()
                     {
                       navigate(context: context, route: Routes.noPostsScreen);
                     },
                     child: Image.asset(ImageConstants.communitySettingsImage)),
               ),
             ],
           hasActions: true,
           hasLeading: true,
           hasTitle: true,
         ),
       ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.h,),
            LineWidget(),
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,top: 10.h),
              child: ResuableText(
                text: 'Posts for you',
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700 ,

              ),
            ),
            SizedBox(height: 12.3.h,),
            LineWidget(),
            NoSearchResultWidget(),
            Expanded(
                child: Container(
                  color: AppColors.cE7ECF0,
                ))


          ]
      ),

      floatingActionButton:  GestureDetector(
        onTap: ()
        {
          navigate(context: context, route: Routes.addPostScreen);
        },
        child: Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
                color: AppColors.c4C9EEB,
                shape: BoxShape.circle
            ), child: Image.asset(ImageConstants.addTwitterTextImage)),
      ),
    );
  }
}
