

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commons/functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/widgets/resuable_text.dart';
import '../widgets/line_widget.dart';
import '../widgets/no_search_result_widget.dart';

class SearchPostsScreen extends StatelessWidget {
  const SearchPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w),
            child: Center(
              child: Stack(
                children: [
                  Image.asset(ImageConstants.roundPostTwitter),
                  PositionedDirectional(
                    start: 23.w,
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
                  contentPadding: EdgeInsetsDirectional.only(start:20.w,bottom: 15.h),
                  hintText: 'Search Posts',
                  hintStyle: AppKhaledStyles.textStyle(
                    color: AppColors.cAFB8C1,
                    size: 12,
                  )
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding:  EdgeInsetsDirectional.only(end: 11.5.w),
            child: GestureDetector(
                onTap: ()
                {
                  navigate(context: context, route: Routes.noPostsScreen);
                },
                child: Image.asset(ImageConstants.communitySettingsImage)),
          )
        ],
      ),
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LineWidget(),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 20.w),
            child: ResuableText(
              text: 'Posts for you',
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700 ,

            ),
          ),
          SizedBox(height: 12.h,),
          LineWidget(),
          NoSearchResultWidget(),
          Expanded(
              child: Container(
                color: AppColors.cE7ECF0,
              ))


        ]
      ),


      floatingActionButton: GestureDetector(
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
