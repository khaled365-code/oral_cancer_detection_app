



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../generated/l10n.dart';

class FeedBackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          title: S.of(context).feedback,
        ),
      ),

      body:Padding(
        padding:  EdgeInsetsDirectional.only(top: 15.h),
        child: Column(
            children: [
              Center(
                  child: Text(
                S.of(context).howrate,
                style: AppTextStyles.font16.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.normal),
              )),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                ],
              ), //stars
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding:EdgeInsetsDirectional.symmetric(horizontal: 80.w),
                child: Row(
                  children: [
                    Text(
                      S.of(context).poor,
                      style: AppTextStyles.font14.copyWith(
                          color: AppColors.grgr, fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Text(
                      S.of(context).excellent,
                      style: AppTextStyles.font14.copyWith(
                          color: AppColors.grgr, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ), //rating
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding:EdgeInsetsDirectional.only(start: 20.w),
                child: Column(
                  children: [
                    Divider(
                      thickness: 0,
                      color: AppColors.grgr,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).leavecomment,
                          style: AppTextStyles.font16
                              .copyWith(color: AppColors.black),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          S.of(context).impfeed,
                          style: AppTextStyles.font16.copyWith(
                              color: AppColors.grgr,
                              fontWeight: FontWeight.normal),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Divider(
                      thickness: 0,
                      color: AppColors.grgr,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                child: SharedButton(
                  text: S.of(context).sendfeedback,
                  buttonColor: AppColors.primary,
                  textStyle: AppTextStyles.font16.copyWith(
                    color: AppColors.white,
                  ),
                  width: double.infinity,
                  hasBorderRadius: true,
                  borderRadiusValue: 10.r,
                ),
              ),
            ],
          ),
        ),

    );

  }
}
