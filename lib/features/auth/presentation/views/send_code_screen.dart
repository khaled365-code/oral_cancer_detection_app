import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_pass_views.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/widgets/custom_textformfield.dart';
import '../../../../core/widgets/default_textform_field.dart';

class SendCode extends StatelessWidget {
  const SendCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey();
    return Form(
      key: formKey,
      child: CustomPassViews(
          buttonText: 'sendcode'.tr(context),
          mainTitle: 'ForgetPassword'.tr(context),
          subTitle: 'donntworrysen'.tr(context),

        centerWidget: DefaultTextFormField(
          textColor: AppColors.black,
          enabledBorderSIdeColor: AppColors.primary,
          focusedBorderSIdeColor: AppColors.primary,
          hintColor:  AppColors.black,
          labelColor: AppColors.black,
          labelText:'email'.tr(context),
          hintText: 'enteremail'.tr(context),
        ),
        buttonPress: (){
          if(formKey.currentState!.validate()){
            navigate(context: context, route: Routes.otpScreen);
          }
        },

      ),
    );
  }
}