import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class MedicalRecordItem extends StatelessWidget {
  const MedicalRecordItem({super.key, required this.d_Name, required this.d_Date});
  final String d_Name;
  final String d_Date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(d_Name,
                    style:AppTextStyles.font18),
                  Text(d_Date,
                    style:AppTextStyles.font18 ),
                ]
        ),
        SizedBox(height: 10.h,),
        Divider(indent: 16,endIndent: 16,thickness:1,color: AppColors.primary,),
        SizedBox(height: 30.h,),
      ],
    );
  }
}
