import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/utilis/app_colors.dart';



class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isShowed1=true;
  bool isShowed2=true;
  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [

                  ClipOval(
                  child:Image.asset(AppAssets.lock ,width: 100,),),
                  const SizedBox(height: 20,),
                  const Text("Create New Password",style: AppTextStyles.font24),

                   Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 38,vertical: 10),
                    child: Text("Your New Password Should be different from Previously used Password",textAlign: TextAlign.center,style:
                   AppTextStyles.font14.copyWith(color: AppColors.semiBlack)),
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(
                    obscureValue:isShowed1,
                    hintText: 'Enter a new password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon:IconButton(
                      icon:isShowed1?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                      onPressed: (){
                        isShowed1=!isShowed1;
                        setState(() {});
                      },),
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFormField(
                    obscureValue:isShowed2,
                    hintText: 'Confirm your  password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon:IconButton(
                      icon:isShowed2?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                      onPressed: (){
                        isShowed2=!isShowed2;
                        setState(() {});
                      },),

                  ),
                  const SizedBox(height: 20,),
                  CustomElevatedButton(
                    onpress: (){
                      if(formKey.currentState!.validate()) {
                       navigate(context: context, route: Routes.congratulationScreen);
                      }
                    },
                    child: const Text("Change"),
                    buttonBackground: AppColors.primary,
                  )

                ],),
            ),
          ),
        ),
      ),
    );
  }
}
