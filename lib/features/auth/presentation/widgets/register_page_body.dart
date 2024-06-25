import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/auth/data/manager/sign_up_cubit.dart';
import 'package:graduation_project/features/auth/data/manager/sign_up_state.dart';
import 'package:graduation_project/features/auth/presentation/widgets/custom_empty_container.dart';
import '../../../../../core/commons/functions.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';

class RegisterBody extends StatefulWidget{
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  bool isSecured=true;
  bool isSecuredConf=true;
  GlobalKey<FormState> formKey=GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit,SignUpState>(
      listener: (context, state) {
       if(state is SignUpFailure){
         showSnackBar(context, content: state.errorMessage);
       }
       else if(state is SignUpSuccess){
         showSnackBar(context, content:state.message);
         navigate(context: context, route: Routes.loginScreen);
        context.read<SignUpCubit>().signUpName.clear();
        context.read<SignUpCubit>().signUpEmail.clear();
        context.read<SignUpCubit>().signUpPassword.clear();
        context.read<SignUpCubit>().signUpConfPassword.clear();

       }
      },
     builder: (context, state) {
      return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 180.h,),
              EmptyContainer(
                child: Form (
                  key: formKey,
                  child:Padding(
                    padding:EdgeInsetsDirectional.only(top:20.h,end:16.w,start:16.w),
                    child:Column(
                      children: [
                        Text("Register With Us!".tr(context),
                            style:AppTextStyles.font18.copyWith(
                              color: AppColors.background ,
                            ),
                        ),
                        SizedBox(height:5.h,),
                        Text("Your information is safe with us".tr(context),
                          style:AppTextStyles.font16.copyWith(
                            color: AppColors.background ,
                          ),
                        ),
                        SizedBox(height:16.h,),
                        CustomTextFormField(labelText:"UserName".tr(context),hintText:"Enter your name".tr(context),
                         controller:context.read<SignUpCubit>().signUpName,),
                        SizedBox(height:10.h,),
                       CustomTextFormField( labelText:"email".tr(context),hintText:"enteremail".tr(context),
                           controller:context.read<SignUpCubit>().signUpEmail),
                        SizedBox(height:10.h,),
                        CustomTextFormField( labelText:"password".tr(context),
                            hintText:"enter your password".tr(context),
                          controller:context.read<SignUpCubit>().signUpPassword,
                          obscureValue: isSecured,
                          suffixIcon:IconButton(
                            onPressed: (){
                              isSecured=!isSecured ;
                              setState(() {});
                            },
                            icon:isSecured?
                            const Icon(Icons.visibility_off,color:AppColors.background):
                            const Icon(Icons.visibility,color:AppColors.background) ,),
                        ),
                        SizedBox(height:10.h,),
                        CustomTextFormField(labelText:"Confirm password".tr(context),
                            hintText:"Confirm your password".tr(context),
                            controller:context.read<SignUpCubit>().signUpConfPassword,
                            obscureValue: isSecuredConf,
                            onSubmitted: (value){
                              if(formKey.currentState!.validate()){
                                context.read<SignUpCubit>().Register();
                              }
                            },
                            suffixIcon:IconButton(
                            onPressed: (){
                              isSecuredConf=!isSecuredConf;
                              setState(() {});
                            },
                            icon:isSecuredConf?
                            const Icon(Icons.visibility_off,color:AppColors.background):
                            const Icon(Icons.visibility,color:AppColors.background),)
                          ),
                        SizedBox(height:17.h,),
                         state is SignUploading?CircularProgressIndicator():
                         CustomButton(
                          buttonBackground: AppColors.background,
                          buttonTextColor: AppColors.primary,
                          buttonText:"Sign Up".tr(context) ,
                          onTap:(){
                             if(formKey.currentState!.validate()){
                               context.read<SignUpCubit>().Register();
                             }
                          },),
                        SizedBox(height:10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?".tr(context) ,
                              style: AppTextStyles.font14.copyWith(
                                  color:AppColors.background,),),
                            GestureDetector(
                              onTap: (){
                                navigate(context: context, route: Routes.loginScreen);
                              },
                              child:Text(" login".tr(context),
                                style:AppTextStyles.font14.copyWith(
                                    color: AppColors.background,
                                    fontFamily: 'lato'),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    ),

                ),
            ),
          ],
        ),
    );
  },
);
  }
}