import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/diagnosis/presentation/widgets/result_circular_percent.dart';
import 'package:graduation_project/features/diagnosis/presentation/widgets/result_row_buttons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../cubits/questions_cubit/question_diagnosis_cubit.dart';
import '../widgets/result_container.dart';

class DiagnosisResultView extends StatelessWidget {
  const DiagnosisResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ResultCircularPercent()
            ),
            SizedBox(height: 50.h,),
            Container(
              height: 470.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                    Text('Here is Your Result !',style: AppTextStyles.font18.copyWith(color: AppColors.primary),),
                    SizedBox(height: 20.h,),
                    ResultContainer(),
                    SizedBox(height: 30.h,),
                    ResultRowButtons(),
                    SizedBox(height: 10.h,),
                    Image.asset('assets/images/tttt.jpg')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
