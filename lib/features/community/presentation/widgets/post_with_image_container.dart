

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';

class PostWithImageContainer extends StatelessWidget {
  const PostWithImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 55.w,
                height: 55.w,
                decoration: BoxDecoration(
                ), child: CircleAvatar(
                  backgroundColor: AppColors.transparent,
                  child: Image.asset(ImageConstants.manCommentImage,fit: BoxFit.contain,)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Martha Craig',style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight:FontWeight.w700 ,
                      size: 13 ,
                    ),),
                    SizedBox(height: 3.h,),
                    Text('@khale_mo',style: AppKhaledStyles.textStyle(
                      color: AppColors.cDADDE0,
                      weight:FontWeight.w700 ,
                      size: 11,
                    ),),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(top: 23.h,),
            child: Text('~~ hiring for a UX Lead in Sydney - who should I talk to?')
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(top: 25.h,end: 21.w),
            child: Container(
                child: Image.asset(ImageConstants.photoForPostImage,fit: BoxFit.fill,)),
          ),

        ],
      ),

    );
  }
}
