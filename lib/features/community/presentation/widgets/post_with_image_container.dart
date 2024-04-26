

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
                ), child: Image.asset(ImageConstants.manCommentImage,fit: BoxFit.fill,),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('martha criag',style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight:FontWeight.w600 ,
                      size: 13 ,
                    ),),
                    SizedBox(height: 3.h,),
                    Text('@khaled_mo',style: AppKhaledStyles.textStyle(
                      color: AppColors.c687684,
                      weight:FontWeight.w500 ,
                      size: 11,
                    ),),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(top: 23.h,),
            child: Text(
              'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou',
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: AppKhaledStyles.textStyle(
                color: AppColors.black,
                size: 14,
                weight: FontWeight.w400,

              ),),),
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
