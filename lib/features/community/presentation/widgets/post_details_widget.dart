

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';

class PostDetailsWidget extends StatelessWidget {
  const PostDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414.w,
      height: 341.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border(
          top: BorderSide(
            color:AppColors.cEFF0F3
          )
        )
      ),
      child: Padding(
        padding:  EdgeInsetsDirectional.only(start: 20.w,top: 10.h),
        child: Column(
          children:
          [
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
            Expanded(child: Padding(
              padding:  EdgeInsetsDirectional.only(top: 23.h,start: 5.w),
              child: Text('~~ hiring for a UX Lead in Sydney - who should I talk to?'),
            )),
            Row(
              children: [
                Text('09:28',style: AppKhaledStyles.textStyle(
                  color: AppColors.cA1A9B2,
                  weight:FontWeight.w600 ,
                  size: 13 ,
                ),),
                SizedBox(width: 10.w,),
                Text('2/21/20',style: AppKhaledStyles.textStyle(
                  color: AppColors.cA1A9B2,
                  weight:FontWeight.w600 ,
                  size: 13,
                ),),
              ],
            ),
            SizedBox(height: 15.h,),
            Container(
              height: 1.h,
              color: AppColors.cEFF0F3,
            ),
            Padding(
              padding:  EdgeInsets.only(top: 13.h,),
              child: Row(
                children: [
                  Text('13',style: AppKhaledStyles.textStyle(
                    color: AppColors.black,
                    weight:FontWeight.w600 ,
                    size: 13 ,
                  ),),
                  SizedBox(width: 5.w,),
                  Text('Likes',style: AppKhaledStyles.textStyle(
                    color: AppColors.cA1A9B2,
                    weight:FontWeight.w600 ,
                    size: 13,
                  ),),
                ],
              ),
            ),
            SizedBox(height: 12.h,),
            Container(
              height: 1.h,
              color: AppColors.cEFF0F3,
            ),
            Padding(
              padding:EdgeInsetsDirectional.only(top: 13.h,start: 38.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Image.asset(ImageConstants.commentImage),
                  Spacer(),
                  Image.asset(ImageConstants.retweetImage),
                  Spacer(),
                  Image.asset(ImageConstants.heartImage),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height:13.h),

          ],
        ),
      ),
    );
  }
}
