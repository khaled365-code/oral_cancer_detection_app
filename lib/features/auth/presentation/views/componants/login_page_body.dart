import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_empty_container.dart';

import 'custom_form_container.dart';

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
         const SizedBox(height: 180,),
         EmptyContainer(
           child: Form(
               key: formKey,
               child: Padding(
                 padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
                 child: Column(
                   children: [
                     Text('Login',
                       style:AppTextStyles.font20.copyWith(
                           color:AppColors.background ),
                     ),
                     const SizedBox(height: 8,),
                     Text('  Welcome Back!',
                       style:AppTextStyles.font20.copyWith(
                           color:AppColors.background ),
                     ),
                     const SizedBox(height: 16,),
                     const CustomContainer(conHeight:150,conWidth: 170,conImage:AppAssets.login1,),
                     const SizedBox(height: 18,),
                     const CustomTextFormField(
                         labelText: 'Email',
                         hintText: 'Enter your email'),
                     const SizedBox(height: 8,),
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
                     const SizedBox(height: 8,),
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
                     const SizedBox(height: 16,),
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
                     const SizedBox(height: 10,),
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