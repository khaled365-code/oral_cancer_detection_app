

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/widgets/shared_button.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../../../../core/widgets/custom_outlined_textfield.dart';
import '../../../../core/widgets/resuable_text.dart';

class PutNewPasswordScreen extends StatelessWidget {
  const PutNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Padding(
                padding:  EdgeInsetsDirectional.only(top: 40.h,start: 15.w,end: 25.w),
                child: BodyAppBar(
                  hasLeading: true,
                  hasTitle: true,
                  leading: GestureDetector(
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.cEFF0F3,
                              width: 2.w
                          )
                      ),
                      child: Icon(Icons.arrow_back_outlined,size: 20.sp,),
                    ),
                  ) ,
                  title: Text('Password Manager',style: AppKhaledStyles.textStyle(color: AppColors.black,weight: FontWeight.bold,size: 15.sp),),
                ),
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 20.w,top: 30.h),
                child: ResuableText(
                  text: 'Current Password',
                  fontSize: 12,
                  color: AppColors.c353535,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 18.w,end:  20.w),
                child: CustomOutlinedTextField(
                  hasSuffixIcon: true,
                  suffixIcon: Icons.visibility_off_outlined,
          
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,),
              ),
              Row(
                children: [
                  Spacer(),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(end: 20.w,top: 15.h),
                    child: ResuableText(
                      textDecoration: TextDecoration.underline,
                      text: 'Forgot Password?',
                      fontSize: 12,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 20.w,top: 30.h),
                child: ResuableText(
                  text: 'New Password',
                  fontSize: 12,
                  color: AppColors.c353535,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 18.w,end:  20.w),
                child: CustomOutlinedTextField(
                  hasSuffixIcon: true,
                  suffixIcon: Icons.visibility_off_outlined,
          
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,),
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 20.w,top: 20.h),
                child: ResuableText(
                  text: 'Confirm New Password',
                  fontSize: 12,
                  color: AppColors.c353535,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 18.w,end:  20.w),
                child: CustomOutlinedTextField(
                  hasSuffixIcon: true,
                  suffixIcon: Icons.visibility_off_outlined,
          
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,),
              ),
              Spacer(),
              Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 20.h,start: 20,end: 20.w),
                child: SharedButton(
                    hasBorderRadius: true,
                    borderRadiusValue: 25,
                    height: 50,
                    btnTextStyle: AppKhaledStyles.textStyle(
                      color: AppColors.white
                    ),
                    btnText: 'Change Password',
                    onPressed: (){}),
              )
          
            ],
          ),
        ),
      ),

    );
  }
}
