import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';


class HospitalCard extends StatelessWidget{
  HospitalCard ({super.key , required this.image,
    required this.hosName,
    required this.aboutHos, required this.hosNumber ,
    required this.location,});

  String image;
  String hosName;
  String aboutHos;
  String hosNumber;
  String location;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        height: MediaQuery.of(context).size.height* 0.50,
        width:MediaQuery.of(context).size.width* 0.50,
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(color: AppColors.primary,width: 3),
          borderRadius: BorderRadius.circular(12.r)  ,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(8, 8),
            ),
          ],
        ),
        child:Padding(
          padding:EdgeInsetsDirectional.only(top:10 ,end:8.w,bottom: 8.h,start: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height:115.h,
                width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Text(hosName,
                style:AppTextStyles.font18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black ,),
              ),
              SizedBox(height:8.h,),
              Text(aboutHos ,
                style:AppTextStyles.font16.copyWith(
                    color: AppColors.black ,
                    fontFamily: 'lato'),
              ),
              SizedBox(height:8.h,),
              Text('Contact info: $hosNumber',
                style:AppTextStyles.font16.copyWith(
                  color: AppColors.primary,),
              ),
              SizedBox(height:8.h,),
              Text('Location: $location',
                style:AppTextStyles.font16.copyWith(
                  color: AppColors.primary,),
              ),
            ],
          ),
        ),

      ),
    );
  }
}