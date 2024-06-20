import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/features/diagnosis/presentation/cubits/questions_cubit/question_diagnosis_cubit.dart';
import 'package:graduation_project/features/home/data/models/medical_record_models/medical_record_model.dart';

import '../cubits/medical_records_cubits/get_medical_record_cubit.dart';

class MedicalRecordItem extends StatelessWidget {
  const MedicalRecordItem({super.key,  required this.medicalRecordModel});
  final MedicalRecordModel medicalRecordModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Result',
                      style:AppTextStyles.font20.copyWith(color: AppColors.primary,)),
                     SizedBox(width: 10.w,)
                      , Flexible(
                       child: Text(medicalRecordModel.diagnosis,
                          style:AppTextStyles.font16,textAlign: TextAlign.center,),
                     ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date',
                      style:AppTextStyles.font20.copyWith(color: AppColors.primary,),),
                      Text(splitingDate(),
                        style:AppTextStyles.font18 ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Time',
                        style:AppTextStyles.font20.copyWith(color: AppColors.primary,),),
                      Text(splitingTime(),
                          style:AppTextStyles.font18 ),
                    ],
                  ),
                ]
        ),
        SizedBox(height: 10.h,),
        Divider(indent: 16,endIndent: 16,thickness:1,color: AppColors.primary,),
        SizedBox(height: 30.h,),
      ],
    );
  }
  String splitingDate(){
    String date=medicalRecordModel.diagnosisDate.split(" ").first;
    return date;
  }
  String splitingTime(){
    String time=medicalRecordModel.diagnosisDate.split(" ").last;
    return time;
  }
}
