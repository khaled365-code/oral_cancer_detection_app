import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/core/widgets/row_title.dart';

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.background,
          title: const RowTitle(),
          titleSpacing: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Form(
            key: formKey,
            child: Center(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text('Login',
                          style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8,),
                        const Text('  Welcome Back!',
                          style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold),),
                        const SizedBox(height: 16,),
                        const CustomContainer(conHeight:150,conWidth: 170,conImage:AppAssets.login1,),
                        const SizedBox(height: 18,),
                        CustomTextFormField(labelText: 'Email',
                            hintText: 'Enter your email'),
                        const SizedBox(height: 8,),
                        CustomTextFormField(labelText: 'Password',
                          hintText: 'Enter Your password', obscureValue: isSecured,
                          suffixIcon: IconButton(onPressed: () {
                            isSecured = !isSecured;
                            setState(() {});
                          },
                            icon: isSecured ? const Icon(Icons.visibility_off) :
                            const Icon(Icons.visibility),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        TextButton(onPressed: () {
                          navigate(context: context, route: Routes.sendCode);
                        },
                          child: const Text('Forget Password?',
                            style: TextStyle(
                              color:AppColors.primary,
                              fontSize: 18,
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
                            const Text("Don't have an account ?"),
                            GestureDetector(
                              onTap: () {
                                navigate(context: context, route: Routes.registerScreen);
                              },
                              child: const Text('Sign Up',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ),
                          ],
                        ),

                      ],

                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


