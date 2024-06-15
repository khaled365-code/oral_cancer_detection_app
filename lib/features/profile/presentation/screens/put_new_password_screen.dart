

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/widgets/shared_button.dart';
import 'package:graduation_project/features/profile/presentation/manager/update_password_cubit/update_password_cubit.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../../../../core/widgets/custom_outlined_textfield.dart';
import '../../../../core/widgets/resuable_text.dart';

class PutNewPasswordScreen extends StatelessWidget {
  const PutNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatePasswordFromSettingsCubit, UpdatePasswordFromSettingsState>(
  listener: (context, state) 
  {
    if(state is UpdatePasswordSuccessState )
      {
        showToast(msg: state.successMessage, toastStates: ToastStates.success);
      }
    if(state is UpdatePasswordFailureState )
    {
      showToast(msg: state.errorMessage, toastStates: ToastStates.error);
    }
  },
  builder: (context, state) {
    final updatePasswordCubit=BlocProvider.of<UpdatePasswordFromSettingsCubit>(context);
    return Scaffold(

      body: SingleChildScrollView(
        child: Form(
          key: updatePasswordCubit.updatePasswordKey,
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
                    obsecureText: updatePasswordCubit.oldPasswordObscure,
                    suffixIconOnTap: ()
                    {
                      updatePasswordCubit.updateOldPasswordIcon();
                    },
                    validator: (value)
                    {
                      if(updatePasswordCubit.oldPasswordController.text=='')
                      {
                       return 'Please Enter Your Old Password';
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onFieldSubmitte: (value)
                    {
                      if(updatePasswordCubit.updatePasswordKey.currentState!.validate())
                      {
                        updatePasswordCubit.updatePassword(
                            oldPassword: updatePasswordCubit.oldPasswordController.text,
                            newPassword: updatePasswordCubit.newPasswordController.text,
                            confirmNewPassword: updatePasswordCubit.confirmNewPasswordController.text
                        );

                      }

                    },
                    hasSuffixIcon: true,
                    suffixIcon: updatePasswordCubit.oldPasswordIcon,
                    controller: updatePasswordCubit.oldPasswordController,
                    keyboardType: TextInputType.text,),
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 20.w,top: 15.h),
                  child: ResuableText(
                    textDecoration: TextDecoration.underline,
                    text: 'Forgot Password?',
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
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
                    obsecureText: updatePasswordCubit.newPasswordObscure,
                    suffixIconOnTap: ()
                    {
                      updatePasswordCubit.updateNewPasswordIcon();
                    },
                    validator: (value)
                    {
                      if(updatePasswordCubit.newPasswordController.text!=updatePasswordCubit.confirmNewPasswordController.text)
                      {
                        return 'passwords don\'t match';
                      }
                      if(updatePasswordCubit.confirmNewPasswordController.text=='')
                      {
                        return 'please enter your new password to continue';
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onFieldSubmitte: (value)
                    {
                      if(updatePasswordCubit.updatePasswordKey.currentState!.validate())
                      {
                        updatePasswordCubit.updatePassword(
                            oldPassword: updatePasswordCubit.oldPasswordController.text,
                            newPassword: updatePasswordCubit.newPasswordController.text,
                            confirmNewPassword: updatePasswordCubit.confirmNewPasswordController.text
                        );

                      }

                    },
                    hasSuffixIcon: true,
                    suffixIcon: updatePasswordCubit.newPasswordIcon,

                    controller: updatePasswordCubit.newPasswordController,
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
                    obsecureText: updatePasswordCubit.confirmNewPasswordObscure,
                    suffixIconOnTap: ()
                    {
                      updatePasswordCubit.updateConfirmNewPasswordIcon();
                    },
                    validator: (value)
                    {
                      if(updatePasswordCubit.newPasswordController.text!=updatePasswordCubit.confirmNewPasswordController.text)
                        {
                          return 'passwords don\'t match';
                        }
                      if(updatePasswordCubit.confirmNewPasswordController.text=='')
                      {
                       return 'please confirm your new password to continue';
                      }
                      else
                        {
                          return null;
                        }
                    },
                    onFieldSubmitte: (value)
                    {
                      if(updatePasswordCubit.updatePasswordKey.currentState!.validate())
                        {
                          updatePasswordCubit.updatePassword(
                          oldPassword: updatePasswordCubit.oldPasswordController.text,
                          newPassword: updatePasswordCubit.newPasswordController.text,
                          confirmNewPassword: updatePasswordCubit.confirmNewPasswordController.text
                          );

                        }

                    },
                    hasSuffixIcon: true,
                    suffixIcon: updatePasswordCubit.confirmNewPasswordIcon,
                    controller: updatePasswordCubit.confirmNewPasswordController,
                    keyboardType: TextInputType.text,),
                ),
                Spacer(),
                state is UpdatePasswordLoadingState ? Padding(
                  padding:  EdgeInsets.only(bottom: 25.h),
                  child: Center(child: CircularProgressIndicator(
                    color: AppColors.primary,
                  )),
                ):
                Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 25.h,start: 20,end: 20.w),
                  child: SharedButton(
                      width: 410,
                      hasBorderRadius: true,
                      borderRadiusValue: 25,
                      height: 50,
                      btnTextStyle: AppKhaledStyles.textStyle(
                        color: AppColors.white,
                        size: 16
                      ),
                      btnText: 'Change Password',
                      onPressed: ()
                      {
                        if(updatePasswordCubit.updatePasswordKey.currentState!.validate())
                          {
                            updatePasswordCubit.updatePassword(
                                oldPassword: updatePasswordCubit.oldPasswordController.text,
                                newPassword: updatePasswordCubit.newPasswordController.text,
                                confirmNewPassword: updatePasswordCubit.confirmNewPasswordController.text
                            );
                          }

                      }),
                )

              ],
            ),
          ),
        ),
      ),

    );
  },
);
  }
}
