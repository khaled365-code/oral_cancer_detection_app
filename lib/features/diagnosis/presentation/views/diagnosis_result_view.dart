import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../cubits/questions_cubit/question_diagnosis_cubit.dart';

class DiagnosisResultView extends StatelessWidget {
  const DiagnosisResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 105.r,
                child: CircularPercentIndicator(
                  animationDuration: 1900,
                  animation: true,
                  radius: 100,
                  lineWidth: 20,
                  percent:CacheHelper().getData(key: 'probCancer'),
                  progressColor: AppColors.primary,
                  backgroundColor: AppColors.grey,
                  circularStrokeCap: CircularStrokeCap.square,
                  center: Text("Percentage  ${(CacheHelper().getData(key: 'probCancer')*100).toStringAsFixed(0)}%",style: AppTextStyles.font12,),

                ),
              ),
            ),
            SizedBox(height: 60.h,),
            Container(
              height: 500.h,
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
                    Container(
                      decoration:  BoxDecoration(
                        //border: Border.all(color: AppColors.primary,width: 2),
                        color: AppColors.background,
                       // gradient: LinearGradient(colors: [AppColors.background,AppColors.primary],begin: Alignment.topLeft,end: Alignment.bottomRight),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r),topRight: Radius.circular(16.r),bottomLeft: Radius.circular(16.r)),

                      ),
                      child:  Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Center(child: Text("TestResult".tr(context),style: AppTextStyles.font24,)
                            // ),
                            // SizedBox(height: 40.h,),
                            Row(
                              children: [
                                Text("DiseaseName".tr(context),style: AppTextStyles.font18),
                                Flexible(
                                  child: Text(BlocProvider.of<QuestionDiagnosisCubit>(context).ConvertToDiseaseName(context),style: AppTextStyles.font18,
                                    //overflow:TextOverflow.clip ,
                                    //maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              children: [
                                Text('Classification:'.tr(context),
                                  style:AppTextStyles.font18 ,textAlign: TextAlign.center,),
                                Text(BlocProvider.of<QuestionDiagnosisCubit>(context).ConvertToClassName(context),style: AppTextStyles.font18,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              children: [
                                Text('Image Classification: ',
                                  style:AppTextStyles.font18 ,textAlign: TextAlign.center,),
                                Text(CacheHelper().getData(key: "imageClassify"),style: AppTextStyles.font18,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(start: 60.w),
                      child: Row(
                        children: [
                          CustomElevatedButton(
                            buttonBackground: AppColors.primary,
                            onpress: (){
                              navigate(context: context, route: Routes.home);
                            }, child:  Text("BackToHome".tr(context)),),
                          SizedBox(width: 30.w,),
                          CustomElevatedButton(
                            buttonBackground: AppColors.primary,
                            onpress: (){
                              BlocProvider.of<QuestionDiagnosisCubit>(context).navigationToLearnMore(context);
                            },
                            child:  Text("Learn More"),),
                        ],
                      ),
                    ),
                    Image.asset('assets/images/vector (1).png')


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
