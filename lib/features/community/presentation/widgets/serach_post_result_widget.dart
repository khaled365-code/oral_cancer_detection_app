

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/community/data/models/search_model/data_serach.dart';

import '../../../../core/utilis/colors.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key,required this.serachModel});


  final DataSearch? serachModel;
  @override
  Widget build(BuildContext context) {
    return serachModel==null? SizedBox.shrink():Container(
      width: 414.w,
      padding: EdgeInsetsDirectional.only(end: 20.w,),
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
                child: Container(
                  width: 55.w,
                  height: 55.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(serachModel!.post!.image ?? ''),
                          fit: BoxFit.fill
                      )
                  ),
                ),
              ),
              SizedBox(width: 8.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Text('${getUserName(currentUserName: serachModel!.userdata!.name ?? '')}',
                          style: AppKhaledStyles.textStyle(
                            color: AppColors.black,
                            weight:FontWeight.w700 ,
                            size: 13,
                          ),),
                        SizedBox(width: 3.h,),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Text('${getEmail(currentEmail:serachModel!.userdata!.email ?? '')}', style: AppKhaledStyles
                              .textStyle(
                            color: AppColors.c687684,
                            weight:FontWeight.w500 ,
                            size: 11,
                          ),),
                        ),
                        SizedBox(width: 5.h,),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Text('${getTimeDifference(postDate: DateTime.parse(serachModel!.post!.createdAt ?? ''))}', style: AppKhaledStyles.textStyle(
                            color: AppColors.c687684,
                            weight:FontWeight.w500 ,
                            size: 10,
                          ),),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: SizedBox(
                              width: 10.25,
                              height: 5.5,
                              child: Image.asset(
                                  ImageConstants.downArrowImage)),
                        ),

                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Text(
                      serachModel!.post!.body ?? '',
                      style: AppKhaledStyles.textStyle(
                        color: AppColors.black,
                        size: 14,
                        weight: FontWeight.w400,

                      ),),
                    SizedBox(height: 10.h,),
                    Row(
                      children:
                      [

                        Container(child: Image.asset(ImageConstants.commentImage)),
                        SizedBox(width: 3.5.w,),
                        Text('${serachModel!.commentCount ??''}',
                          style: AppKhaledStyles.textStyle(
                            color: AppColors.grey,
                            size: 10,
                          ),),


                        Spacer(),


                       Container(child: Image.asset(ImageConstants.retweetImage)),
                        SizedBox(width: 3.5.w,),
                        Text('0',
                          style: AppKhaledStyles.textStyle(
                            color: AppColors.grey,
                            size: 10,
                          ),),



                        Spacer(),
                        Image.asset(ImageConstants.heartImage),
                        SizedBox(width: 3.5.w,),
                        Text('${serachModel!.likeCount ??''}',
                          style: AppKhaledStyles.textStyle(
                            color: AppColors.grey,
                            size: 10,
                          ),),
                        Spacer(),
                        Container(child: Image.asset(ImageConstants.shareSmallImage,)),
                        SizedBox(width: 11.w,)


                      ],
                    ),
                    SizedBox(height: 10.h,),


                  ],
                ),
              )


            ],
          ),

        ],
      ),
    );
  }
}
