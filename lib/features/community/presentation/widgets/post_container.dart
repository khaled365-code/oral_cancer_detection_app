



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class PostContainer extends StatelessWidget {
  final String postOwner;
  final String postText;
  final String postHours;
  final String postOwnerPhoto;

  const PostContainer({
    super.key, required this.postOwner, required this.postText, required this.postHours, required this.postOwnerPhoto,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: ()
      {

      },
      child: Container(
        width: 414.w,
        height: 130.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, .33),
              color: AppColors.white,
              spreadRadius: 0.r,
              blurRadius: 0.r,
            ),
          ],
          border: Border.all(
              color: AppColors.cE7E7E7,
            width: 1
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsetsDirectional.only(start:5.w,top: 10.h),
              child: Container(
                width: 55.w,
                height: 55.w,
                decoration: BoxDecoration(
                ), child: CircleAvatar(
                backgroundColor: AppColors.transparent,
                  child: Image.asset(postOwnerPhoto,fit: BoxFit.contain,)),
              ),
            ),
            SizedBox(width: 8.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text('Martha Craig',style: AppKhaledStyles.textStyle(
                        color: AppColors.black,
                        weight:FontWeight.w700 ,
                        size: 13 ,
                      ),),
                      SizedBox(width: 3.h,),
                      Padding(
                        padding:  EdgeInsets.only(top: 2.h),
                        child: Text('@khale_mo',style: AppKhaledStyles.textStyle(
                          color: AppColors.cDADDE0,
                          weight:FontWeight.w700 ,
                          size: 11,
                        ),),
                      ),
                      SizedBox(width: 5.h,),
                      Padding(
                        padding:  EdgeInsets.only(top: 2.h),
                        child: Text('14h',style: AppKhaledStyles.textStyle(
                          color: AppColors.cDADDE0,
                          weight:FontWeight.w700 ,
                          size: 11,
                        ),),
                      ),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(top: 2.h),
                        child: SizedBox(
                          width: 10.25,
                            height: 5.5,
                            child: Image.asset(ImageConstants.downArrowImage)),
                      ),
                      SizedBox(width: 19.5.w,)

                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Text('You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou',
                    maxLines:3,
                    overflow: TextOverflow.ellipsis,
                    style: AppKhaledStyles.textStyle(
                    color: AppColors.black,
                    size: 14 ,
                      weight:FontWeight.w400 ,

                    ),),
                  SizedBox(height: 10.h,),
                  Row(
                    children:
                    [
                      Image.asset(ImageConstants.commentImage),
                      SizedBox(width: 3.5.w,),
                      Text('28',
                        style: AppKhaledStyles.textStyle(
                          color: AppColors.grey,
                          size: 10 ,
                        ),),
                      Spacer(),
                      Image.asset(ImageConstants.retweetImage),
                      SizedBox(width: 3.5.w,),
                      Text('28',
                        style: AppKhaledStyles.textStyle(
                          color: AppColors.grey,
                          size: 10 ,
                        ),),
                      Spacer(),
                      Image.asset(ImageConstants.heartImage),
                      SizedBox(width: 3.5.w,),
                      Text('28',
                        style: AppKhaledStyles.textStyle(
                          color: AppColors.grey,
                          size: 10 ,
                        ),),
                      Spacer(),


                    ],
                  )
                ],
              ),
            )


          ],
        ),
      ),
    ) ;
  }
}
/*

Column(
      children: [
        SizedBox(height: 10.h,),
        Container(
          height: 210.h,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage: AssetImage(postOwnerPhoto),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                postOwner,
                                style: AppTextStyles.font16,
                              ),
                              Spacer(),
                              Text(postHours),
                              SizedBox(width: 10.w),
                              Icon(Icons.linear_scale),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Expanded(
                            child: Text(
                              postText,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.font16,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.comment_sharp),
                              SizedBox(width: 100.w,),
                              Icon(Icons.favorite),
                              SizedBox(width: 100.w,),
                              Icon(Icons.share),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ],
    )

 */
