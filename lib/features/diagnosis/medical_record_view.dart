import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/default_app_bar.dart';
import 'package:graduation_project/features/home/presentation/widgets/mr_item.dart';

class MedicalRecordView extends StatelessWidget {
  const MedicalRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:PreferredSize(preferredSize: Size(double.infinity, 40.h),
         child:DefaultAppBar(
           hasActions:false,hasTitle: false,hasLeading: false,
           backgroundColor: AppColors.primary,)),
      backgroundColor:AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w ,vertical: 12.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Diagnosis Result',
                  style:AppTextStyles.font20.copyWith(color: AppColors.primary,),),
                Text('Date',
                  style:AppTextStyles.font20.copyWith(color: AppColors.primary,),),
            ]
            ),
            SizedBox(height: 18.h,),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context,index){
                    return MedicalRecordItem(d_Name: 'Cancer',d_Date:'13-7-2023');
                  },
                  itemCount:20
              ),
            )
          ],
        ),
      )
    );
  }
}

