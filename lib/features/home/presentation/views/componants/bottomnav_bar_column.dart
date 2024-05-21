import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';


class BottomNavColumn extends StatelessWidget {
  const BottomNavColumn({super.key,this.paddingValue,required this.icon,required this.text});
   final double? paddingValue;
   final String text;
   final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(paddingValue??0),
      child: Column(
        children: [
        Icon(icon ,),
        SizedBox(height: 2.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(text,style: AppKhaledStyles.textStyle(
            size: 9,
            weight: FontWeight.w500,

          )),
        ),
        SizedBox(height: 5.h,),

      ],),
    );
  }
}
