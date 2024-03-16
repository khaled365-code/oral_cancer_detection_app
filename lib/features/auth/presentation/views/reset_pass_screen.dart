import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/features/auth/presentation/views/congratulation_view.dart';
import 'package:pinput/pinput.dart';


import '../../../../core/utilis/app_colors.dart';
import '../../../splash/presentation/views/onboearding_screen.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isSecured=true;
  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [

                  ClipOval(
                  child:Image.asset(AppAssets.lock ,width: 100,),),
                  const SizedBox(height: 20,),
                  const Text("Create New Password",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),

                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 38,vertical: 10),
                    child: Text("Your New Password Should be different from Previously used Password",textAlign: TextAlign.center,style:
                    TextStyle(color: Colors.black54,fontSize: 14),),
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(
                    obscureValue:isSecured,
                    hintText: 'Enter a new password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon:IconButton(
                      icon:isSecured?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                      onPressed: (){
                        isSecured=!isSecured;
                        setState(() {});
                      },),
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFormField(
                    obscureValue:isSecured,
                    hintText: 'Confirm your  password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon:IconButton(
                      icon:isSecured?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                      onPressed: (){
                        isSecured=!isSecured;
                        setState(() {});
                      },),
                    controller: TextEditingController(),
                  ),

                  const SizedBox(height: 10,),
                  Pinput(
                    onCompleted: (pin)=> debugPrint(pin),
                    defaultPinTheme: PinTheme(width: 60,height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),borderRadius: BorderRadius.circular(16))),
                    focusedPinTheme: PinTheme(width: 60,height: 60,
                        decoration:
                        BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(16))
                    ),

                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const  CongratulationScreen();
                        }));
                      }
                    },style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(AppColors.primary)
                  ),
                    child: const Text("Change"),
                  )



                ],),
            ),
          ),
        ),
      ),
    );
  }
}
