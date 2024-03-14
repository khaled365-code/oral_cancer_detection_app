import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/commons.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/custom_textformfield.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey();
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  ClipOval(
                    child: Image.asset(AppAssets.lock)
                  ),
                  const SizedBox(height: 20,),
                  const Text("Create New Password",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),

                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 38,vertical: 10),
                    child: Text("Your New Password Should be different from Previously used Password",textAlign: TextAlign.center,style:
                    TextStyle(color: Colors.black54,fontSize: 14),),
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(
                    obscureValue: true,
                    hintText: 'Enter a new password',

                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon:IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off)),
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFormField(obscureValue: true,
                    hintText: 'Confirm your  password',

                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off))
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(obscureValue: true,
                    hintText: 'Enter the code',
                  ),
                  const SizedBox(height: 20,),
                  const SizedBox(height:30 ,),
                  ElevatedButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()) {
                       navigate(context: context, route: Routes.loginScreen);
                      }
                    },style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(AppColors.primary)
                  ),
                    child: const Text("Change "),
                  )



                ],),
            ),
          ),
        ),
      ),
    );
  }
}
