import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';
import 'package:graduation_project/features/diagnosis/data/manager/question_diagnosis_cubit.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/colors.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.background,
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("pleaseNote".tr(context),textAlign: TextAlign.center,style: AppTextStyles.font16.copyWith(color: AppColors.primary)),
            // TextButton(onPressed: (){
            //   navigate(context: context, route: Routes.doctor);
            // }, child: const Text("Click here to show them",style: TextStyle(color: AppColors.black,decoration: TextDecoration.underline),)),
             SizedBox(height: 60.h,),
            Container(
              decoration:  BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.background,AppColors.primary],begin: Alignment.topLeft,end: Alignment.bottomRight),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r),topRight: Radius.circular(16.r),bottomLeft: Radius.circular(16.r)),


              ),
              child:  Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("TestResult".tr(context),style: AppTextStyles.font24,)
                    ),
                    SizedBox(height: 40.h,),
                    Row(
                      children: [
                        Text("DiseaseName".tr(context),style: AppTextStyles.font18),
                        Flexible(
                          child: Text(BlocProvider.of<QuestionDiagnosisCubit>(context).ConvertToClassName(),style: AppTextStyles.font18,
                          //overflow:TextOverflow.clip ,
                          //maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Text("Classification:cancer".tr(context),
                      style:AppTextStyles.font18 ,textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
             SizedBox(height: 50.h,),
            CustomElevatedButton(
              buttonBackground: AppColors.primary,
              onpress: (){
              navigate(context: context, route: Routes.home);
            }, child:  Text("BackToHome".tr(context)),)
          ],),
      ),
    );
  }
}