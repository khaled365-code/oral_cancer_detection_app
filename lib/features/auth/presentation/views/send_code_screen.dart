import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/custom_textformfield.dart';

class SendCode extends StatelessWidget {
  const SendCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(AppAssets.lock,width: 100,),
              ),
              const SizedBox(height: 20,),
              const Text("Forgot Password?",style: AppTextStyles.font26),

               Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 38,vertical: 10),
                child: Text("don't worry! it happens.  please enter the email associated with your with your account",textAlign: TextAlign.center,style:
               AppTextStyles.font14.copyWith(color: AppColors.semiBlack)),
              ),
              const SizedBox(height: 10,),
              const CustomTextFormField(
                labelText: "E-mail",
                hintText: 'Enter your email',
              ),

              const SizedBox(height:30 ,),
              CustomElevatedButton(

                buttonBackground: AppColors.primary,
                  onpress: (){
                if(formKey.currentState!.validate()){
                 navigate(context: context, route: Routes.otpScreen);
                  }
                }, child: Text("Send Code",style:AppTextStyles.font14.copyWith(color: AppColors.white) ,),
              )
            ],),
        ),
      ),
    );
  }
}