


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:shimmer/shimmer.dart';

class MedicalNewsLoadingContainer extends StatelessWidget {
  const MedicalNewsLoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.white,
              boxShadow:
              [
                BoxShadow(
                  color: AppColors.cEAEAEA,
                  blurRadius: 5,
                  spreadRadius: 3,
                )
              ]
          ),
          child: Column(
            children:
            [
              Shimmer.fromColors(
                baseColor: AppColors.cE1E1E1,
                highlightColor: Colors.white,
                child: SizedBox(
                    height: 150.h,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(ImageConstants.oralCancerImage,fit: BoxFit.fill,)),
              ),

              SizedBox(height: 10.h,),
              Shimmer.fromColors(
                baseColor: AppColors.cE1E1E1,
                highlightColor: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: ResuableText(
                      text: 'Most oral cancers arise in the squamous cells, which line the mouth, tongue, gums and lips. These are called squamous cell carcinomas (cancers).',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      maxLines: 2,
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Shimmer.fromColors(
                baseColor: AppColors.cE1E1E1,
                highlightColor: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: ResuableText(
                    text: 'Anything that increases your chances of getting cancer is called a risk factor. Many cases of oral cancers are linked to risk factors. Some patients will develop oral cancers without any known risk factors',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.c232323,
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(height: 20.h,),




            ]
          ),
        ),
        SizedBox(height: 30.h,)
      ],
    );
  }
}
