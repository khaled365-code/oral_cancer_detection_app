import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class DoctorCard extends StatelessWidget{
  DoctorCard({super.key , required this.image, required this.doctorName,
    required this.docDegree , required this.aboutDoc ,
    required this.docNumber,required this.docAddress,});

  String image;
  String doctorName;
  String docDegree;
  String aboutDoc;
  String docNumber;
  String docAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:320.h,
      width: 350.w,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.r)  ,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(8, 8),
          ),
        ],
      ),
      child:Padding(
        padding:EdgeInsetsDirectional.only(end:8.w,bottom: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height:100.h,
                  width:100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width:8.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctorName,
                      style:AppTextStyles.font20.copyWith(
                          color: AppColors.white ,),
                    ),
                    Text(docDegree ,
                      style:AppTextStyles.font16.copyWith(
                        color: AppColors.white ,
                        fontFamily: 'lato'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:8.h,),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About: $aboutDoc',
                    style:AppTextStyles.font14.copyWith(
                      color: AppColors.white ,),
                  ),
                 SizedBox(height:8.h,),
                  Text(' Contact info: $docNumber',
                    style:AppTextStyles.font14.copyWith(
                      color: AppColors.white ,),
                  ),
                  SizedBox(height:8.h,),
                  Text(' Address: $docAddress',
                    style:AppTextStyles.font14.copyWith(
                      color: AppColors.white ,),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}