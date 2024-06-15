import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/auth/presentation/widgets/custom_pass_views.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/routes/routes.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey();
    return Form(
      key: formKey,
      child: CustomPassViews(
          buttonText: 'VerifyProceed'.tr(context)
          , mainTitle: 'OTPVerification'.tr(context),
          subTitle: 'EntertheOTP'.tr(context),
          centerWidget: Pinput(
            validator: (pin){
              if(pin!.isEmpty){
                return 'pleaseEnterCode'.tr(context);
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