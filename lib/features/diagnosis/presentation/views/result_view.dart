import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';

import '../../../../core/utilis/app_colors.dart';

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
             Text("Please note that this result is not definitive and it is important to consult a doctor for further testing and evaluation , we can suggest a professional doctors for you...💙",textAlign: TextAlign.center,style: AppTextStyles.font16.copyWith(color: AppColors.primary)),
            // TextButton(onPressed: (){
            //   navigate(context: context, route: Routes.doctor);
            // }, child: const Text("Click here to show them",style: TextStyle(color: AppColors.black,decoration: TextDecoration.underline),)),
             SizedBox(height: 60.h,),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.background,AppColors.primary],begin: Alignment.topLeft,end: Alignment.bottomRight),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16),bottomLeft: Radius.circular(16)),


              ),
              child:  Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("Test Result",style: AppTextStyles.font24,)
                    ),
                    SizedBox(height: 40.h,),
                    Text("Disease Name:  oscc(oral squamous cancer cell)",style: AppTextStyles.font18),
                    SizedBox(height: 20.h,),
                    Text("Classification:  cancer",style:AppTextStyles.font18,)
                  ],
                ),
              ),
            ),
             SizedBox(height: 50.h,),
            CustomElevatedButton(
              buttonBackground: AppColors.primary,
              onpress: (){
              navigate(context: context, route: Routes.home);
            }, child: const Text("Back To Home"),)
          ],),
      ),
    );
  }
}