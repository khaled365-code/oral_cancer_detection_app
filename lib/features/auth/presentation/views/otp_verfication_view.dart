import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_pass_views.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../generated/l10n.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey();
    return Form(
      key: formKey,
      child: CustomPassViews(
          buttonText: S.of(context).VerifyProceed
          , mainTitle: S.of(context).OTPVerification,
          subTitle: S.of(context).EntertheOTP,
          centerWidget: Pinput(
            validator: (pin){
              if(pin!.isEmpty){
                return S.of(context).pleaseEnterCode;
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