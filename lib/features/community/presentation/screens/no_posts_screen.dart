


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
