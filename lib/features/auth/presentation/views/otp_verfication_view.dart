import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_pass_views.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/commons.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey();
    return Form(
      key: formKey,
      child: CustomPassViews(
          buttonText: "Verify & Proceed"
          , mainTitle: "OTP Verification",
          subTitle: "Enter the OTP sent to email you submitted",
          centerWidget: Pinput(
            validator: (pin){
              if(pin!.isEmpty){
                return 'please enter the code';
              }
            },
            keyboardType: TextInputType.number,
            pinAnimationType: PinAnimationType.slide,
            defaultPinTheme: PinTheme(width: 60.w,height: 60.h,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),borderRadius: BorderRadius.circular(16))),
            focusedPinTheme: PinTheme(width: 60.w,height: 60.h,
                decoration:
                BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(16))
            ),
          ),
          buttonPress: () {
            if (formKey.currentState!.validate()) {
              navigate(context: context, route: Routes.resetNewPass);
            }
          }),
    );
  }
}