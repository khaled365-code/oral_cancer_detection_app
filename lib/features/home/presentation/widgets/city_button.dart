import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class CityNameButton extends StatelessWidget{
  final bool isSelected;
  final VoidCallback onTap;
  final String cityName;

 const CityNameButton({required this.isSelected,
   required this.onTap ,
   required this.cityName});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: isSelected? AppColors.primary:AppColors.background,
          border: Border.all(
            color: AppColors.primary,
            width: 2.w,
          ),
        ),
        width:MediaQuery.of(context).size.width *0.30,
        //height:60.h,
        child: Center(child: Padding(
          padding:EdgeInsets.only(left: 10.w,right: 10.w),
          child: Text(cityName,
            textAlign: TextAlign.center,
            style: AppTextStyles.font20.copyWith(
                color: isSelected?AppColors.background:AppColors.primary,
                fontWeight: FontWeight.w500),
          ),
        ),
        ),
      ),
    );
  }
}