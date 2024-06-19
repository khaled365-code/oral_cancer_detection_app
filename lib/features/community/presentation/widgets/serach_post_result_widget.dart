

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_khaled_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/community/data/models/search_model/data_serach.dart';

import '../../../../core/utilis/fontweight_helper.dart';


class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key,required this.serachModel, required this.maxWidth});


  final DataSearch? serachModel;
  final double maxWidth;
  @override
  Widget build(BuildContext context) {
    return serachModel==null? SizedBox.shrink():
    Container(
      width: maxWidth,
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
                          image: CachedNetworkImageProvider(serachModel!.post!.image ?? ''),
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
                            color: AppColors.c141619,
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
                                  ImageConstants.downArrowImage,color: AppColors.primary)),
                        ),

                      ],
                    ),
                    SizedBox(height: 2.h,),
                    serachModel!.post!.body!=null?
                    Padding(
                      padding:  EdgeInsetsDirectional.only(end: 10.w),
                      child: Text(
                        serachModel!.post!.body!,
                        style: AppKhaledStyles.textStyle(
                          color: AppColors.c141619,
                          size: 14,
                          weight: FontWeightHelper.regular,

                        ),),
                    ):
                    SizedBox.shrink(),
                    SizedBox(height: 5.h,),
                    serachModel!.post!.image!=null?
                    CachedNetworkImage(imageUrl:serachModel!.post!.image!,fit: BoxFit.fill,):
                    SizedBox.shrink(),
                    SizedBox(height: 20.h,),
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
