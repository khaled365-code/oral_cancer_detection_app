import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/utilis/commons.dart';
import '../../../../core/widgets/custom_elevated_button.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);

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
              const Text("OTP Verification",style: AppTextStyles.font26),

              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 38,vertical: 10),
                child: Text("Enter the OTP sent to email you submitted",textAlign: TextAlign.center,style:
                AppTextStyles.font14.copyWith(color: AppColors.semiBlack)),
              ),
              const SizedBox(height: 10,),
              Pinput(
                validator: (pin){
                  if(pin!.isEmpty){
                    return 'please enter the code';
                  }
                },
                keyboardType: TextInputType.number,
                pinAnimationType: PinAnimationType.slide,
                defaultPinTheme: PinTheme(width: 60,height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),borderRadius: BorderRadius.circular(16))),
                focusedPinTheme: PinTheme(width: 60,height: 60,
                    decoration:
                    BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(16))
                ),
              ),
              const SizedBox(height:30 ,),
              CustomElevatedButton(
                buttonBackground: AppColors.primary,
                onpress: (){
                  if(formKey.currentState!.validate()){
                    navigate(context: context, route: Routes.resetNewPass);
                  }
                }, child: Text("Verify & Proceed",style:AppTextStyles.font14.copyWith(color: AppColors.white) ,),
              )
            ],),
        ),
      ),
    );
  }
}