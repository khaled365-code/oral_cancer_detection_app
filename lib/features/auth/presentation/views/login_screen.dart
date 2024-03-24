import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_appbar.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_container.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSecured = true;
  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Scaffold(
        appBar: const PreferredSize(preferredSize: Size(double.infinity, 50),
            child:CustomFormAppBar()),
        body: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Form(
            key: formKey,
            child: CustomFormContainer(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                     const Text('Login',
                        style:AppTextStyles.font20,
                      ),
                      const SizedBox(height: 8,),
                      const Text('  Welcome Back!',
                        style:AppTextStyles.font20,
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
                          icon: isSecured ? const Icon(Icons.visibility_off) :
                          const Icon(Icons.visibility),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {
                        navigate(context: context, route: Routes.sendCode);
                        },
                        child:Text('Forget Password?',
                          style:AppTextStyles.font18.copyWith(
                              color:AppColors.primary,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      CustomButton(buttonText: 'Login', onTap:(){
                        if(formKey.currentState!.validate()){
                          print('Login done');
                          navigate(context: context, route: Routes.home);
                          // here login user function preformed like chat app
                        }

                      },),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account ?",
                                style: AppTextStyles.font14,),
                          GestureDetector(
                            onTap: () {
                              navigate(context: context, route: Routes.registerScreen);
                            },
                            child:Text('Sign Up',
                              style:AppTextStyles.font14.copyWith(
                                  color: AppColors.primary,
                                  fontFamily: 'lato'),
                            ),
                          ),
                        ],
                      ),

                    ],

                  ),
                ),
              ),
            )

              ),
            ),
          ),
    );
  }
}


