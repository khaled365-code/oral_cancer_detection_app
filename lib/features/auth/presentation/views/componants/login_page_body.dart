
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/core/widgets/snackbar.dart';
import 'package:graduation_project/features/auth/data/manager/sign_in_cubit.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_empty_container.dart';
import '../../../../../core/commons/functions.dart';

class LoginBody extends StatefulWidget{
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  bool isSecured = true;
  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<SignInCubit, SignInState>(
  listener: (context, state) {
    if(state is SignInFailureState){
    showSnackBar(context, content: state.errMessage);
    }
    if(state is SignInSuccessState){
      showSnackBar(context, content: state.message);
      navigate(context: context, route: Routes.home);
    }
  },
  builder: (context, state) {
    return SingleChildScrollView (
     child: Column(
       children: [
         SizedBox(height: 180.h,),
         EmptyContainer(
           child: Form(
               key: formKey,
               child: Padding(
                 padding:EdgeInsetsDirectional.only(top: 20.h,end: 16.w,start:16.w),
                 child: Column(
                   children: [
                     Text("login".tr(context),
                       style:AppTextStyles.font20.copyWith(
                           color:AppColors.background ),
                     ),
                     SizedBox(height: 8.h,),
                     Text("welcome back".tr(context),
                       style:AppTextStyles.font20.copyWith(
                           color:AppColors.background ),
                     ),
                     SizedBox(height: 16.h,),
                     CustomContainer(conHeight:150.h,conWidth: 170.w,conImage:ImageConstants.login1,),
                     SizedBox(height: 18.h,),
                      CustomTextFormField(
                       controller: context.read<SignInCubit>().signInEmail,
                         labelText: "email".tr(context),
                         hintText:"enteremail".tr(context)),
                     SizedBox(height: 12.h,),
                     CustomTextFormField
                       (
                       controller:context.read<SignInCubit>().signInPassword ,
                       labelText:"password".tr(context),
                       hintText:"enter your password".tr(context),
                       obscureValue: isSecured,
                       suffixIcon: IconButton(onPressed: () {
                         isSecured = !isSecured;
                         setState(() {});
                       },
                         icon: isSecured ?
                         const Icon(Icons.visibility_off,color:AppColors.background ,) :
                         const Icon(Icons.visibility,color:AppColors.background ,),
                       ),
                     ),
                     SizedBox(height: 5.h,),
                     TextButton(
                       onPressed: () {
                         navigate(context: context, route: Routes.sendCode);
                       },
                       child:Text("forget password".tr(context),
                         style:AppTextStyles.font18.copyWith(
                             color:AppColors.background,
                             fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                         ),
                       ),
                     ),
                     SizedBox(height: 16.h,),
                    state is SignInLoadingState?CircularProgressIndicator(): CustomButton(
                       buttonText:"login".tr(context),
                       buttonBackground: AppColors.background,
                       buttonTextColor: AppColors.primary,
                       onTap:(){
                         if(formKey.currentState!.validate()){
                           context.read<SignInCubit>().signIn();
                         }
                     },),
                     SizedBox(height: 10.h,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                          Text( "Don't have an account".tr(context),
                           style:AppTextStyles.font14.copyWith(
                               color:AppColors.background ),
                          ),
                         GestureDetector(
                           onTap: () {
                             navigate(context: context, route: Routes.registerScreen);
                           },
                           child:Text("Sign Up".tr(context),
                             style:AppTextStyles.font14.copyWith(
                                 color: AppColors.background,
                                 fontFamily: 'lato',
                                 decoration: TextDecoration.underline, ),
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