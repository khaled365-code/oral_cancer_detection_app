import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/features/diagnosis/presentation/cubits/questions_cubit/question_diagnosis_cubit.dart';
import 'package:graduation_project/features/home/data/models/medical_record_models/medical_record_model.dart';

import '../cubits/medical_records_cubits/medical_record_cubit.dart';

class MedicalRecordItem extends StatelessWidget {
  const MedicalRecordItem({super.key,  required this.medicalRecordModel});
  // final String d_Name;
  // final String d_Date;
  final MedicalRecordModel medicalRecordModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(BlocProvider.of<QuestionDiagnosisCubit>(context).ConvertToDiseaseName(context),
                    style:AppTextStyles.font18),
                  Text(medicalRecordModel.diagnosisDate,
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
