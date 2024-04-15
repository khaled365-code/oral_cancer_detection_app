import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_pass_views.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/default_textform_field.dart';

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
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Form(
      key: formKey,
      child: CustomPassViews(
          buttonPress: (){
        if(formKey.currentState!.validate()) {
          navigate(context: context, route: Routes.congratulationScreen);
        }
          },
          centerWidget:
          Column(
            children: [
              DefaultTextFormField(
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
              SizedBox(height: height*0.02,),
              DefaultTextFormField(
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
            ],
          ),
          buttonText: "change",
          mainTitle: "Create New Password",
          subTitle: "Your New Password Should be different from Previously used Password"
      ),
    );
  }
}
