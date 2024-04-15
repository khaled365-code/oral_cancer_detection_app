import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_empty_container.dart';

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
                     Text('Login',
                       style:AppTextStyles.font20.copyWith(
                           color:AppColors.background ),
                     ),
                     SizedBox(height: 8.h,),
                     Text('  Welcome Back!',
                       style:AppTextStyles.font20.copyWith(
                           color:AppColors.background ),
                     ),
                     SizedBox(height: 16.h,),
                     CustomContainer(conHeight:150.h,conWidth: 170.w,conImage:AppAssets.login1,),
                     SizedBox(height: 18.h,),
                     const CustomTextFormField(
                         labelText: 'Email',
                         hintText: 'Enter your email'),
                     SizedBox(height: 8.h,),
                     CustomTextFormField
                       (labelText: 'Password',
                       hintText: 'Enter Your password',
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
                       child:Text('Forget Password?',
                         style:AppTextStyles.font18.copyWith(
                             color:AppColors.background,
                             fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                         ),
                       ),
                     ),
                     SizedBox(height: 16.h,),
                     CustomButton(
                       buttonText: 'Login',
                       buttonBackground: AppColors.background,
                       buttonTextColor: AppColors.primary,
                       onTap:(){
                       if(formKey.currentState!.validate()){
                         print('Login done');
                         navigate(context: context, route: Routes.home);
                         // here login user function preformed like chat app
                       }

                     },),
                     SizedBox(height: 10.h,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                          Text("Don't have an account ?",
                           style:AppTextStyles.font14.copyWith(
                               color:AppColors.background ),
                          ),
                         GestureDetector(
                           onTap: () {
                             navigate(context: context, route: Routes.registerScreen);
                           },
                           child:Text('Sign Up',
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
             )

       ],
     ),
   );

  }
}