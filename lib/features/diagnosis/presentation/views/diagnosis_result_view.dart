import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/diagnosis/presentation/widgets/result_circular_percent.dart';
import 'package:graduation_project/features/diagnosis/presentation/widgets/result_row_buttons.dart';
import 'package:graduation_project/features/home/presentation/cubits/medical_records_cubits/save_medical_record_cubit.dart';
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
    var saveCubit=BlocProvider.of<SaveMedicalRecordCubit>(context);
    return BlocConsumer<QuestionDiagnosisCubit, QuestionDiagnosisState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 20.h,),
            state is QuestionDiagnosisLoadingState?Center(child: CircularProgressIndicator(),):
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
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text('Here is Your Result !',style: AppTextStyles.font18.copyWith(color: AppColors.primary),textAlign: TextAlign.center,),
                        ),
                          
                             BlocConsumer<SaveMedicalRecordCubit, SaveMedicalRecordState>(
                             listener: (context, state) {
                                if(state is SaveMedicalRecordFailure){
                                  showSnackBar(context,content: state.errMessage,contentColor: AppColors.primary);
                                }
                                if(state is SaveMedicalRecordSuccess){
                                  showSnackBar(context,content: state.successMessage,contentColor: AppColors.primary);
                                }
                             },
                           builder: (context, state) {
                               return IconButton(onPressed: (){
                                 if (!saveCubit.isPressed){
                                   saveCubit.toggleSaveIcon();
                                   saveCubit.saveMedicalRecord(context);
                                 }
                                 else{

                                 }

                          },
                               icon:saveCubit.isPressed?Icon( Icons.save_as_rounded,size: 32,color: AppColors.primary,):Icon( Icons.save_as_outlined,size: 32,color: AppColors.primary,));
                          },
                       )
                    
                      ],
                    ),
                    SizedBox(height: 20.h,),
                ResultContainer(),
                    SizedBox(height: 30.h,),
                    ResultRowButtons(),
                    SizedBox(height: 10.h,),
                    Image.asset(ImageConstants.resultImg)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  },
);
  }
}
