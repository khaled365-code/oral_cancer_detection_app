


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';

class NoPostsScreen extends StatelessWidget {
  const NoPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        leading: Padding(
           padding: EdgeInsetsDirectional.only(start: 20.w),
            child: Image.asset(ImageConstants.roundPostTwitter)),
        title: Container(
          decoration: BoxDecoration(
              color: AppColors.cE7ECF0,
              borderRadius: BorderRadius.circular(25.r)
          ),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsetsDirectional.only(start: 12.w,bottom: 8.h),
                hintText: 'Search Twitter',
                prefixIcon: Icon(Icons.search),
                hintStyle: AppKhaledStyles.textStyle(
                  color: AppColors.cAFB8C1,
                  size: 12,
                )
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
    );
  }
}
