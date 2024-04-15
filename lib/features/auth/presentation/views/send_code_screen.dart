import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_pass_views.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/custom_textformfield.dart';
import '../../../../core/widgets/default_textform_field.dart';
import '../../../../generated/l10n.dart';

class SendCode extends StatelessWidget {
  const SendCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey();
    return Form(
      key: formKey,
      child: CustomPassViews(
          buttonText: S.of(context).sendcode,
          mainTitle: S.of(context).forgetpassword,
          subTitle: S.of(context).donntworrysen,

        centerWidget: DefaultTextFormField(
          textColor: AppColors.black,
          enabledBorderSIdeColor: AppColors.primary,
          focusedBorderSIdeColor: AppColors.primary,
          hintColor:  AppColors.black,
          labelColor: AppColors.black,
          labelText:S.of(context).email,
          hintText: S.of(context).enteremail,
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