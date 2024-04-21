

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
       onTap: ()
      {
        navigate(context: context, route: Routes.postDetailsScreen);
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
                  child: Image.asset(ImageConstants.manCommentImage,fit: BoxFit.contain,)),
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
                      Image.asset(ImageConstants.heartImage),
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


                    ],
                  )
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
