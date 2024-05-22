import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';
import 'package:graduation_project/features/auth/data/manager/update_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_pass_views.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/widgets/default_textform_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isNotShowed1=true;
  bool isNotShowed2=true;
  bool isNotShowed3=true;
  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
  listener: (context, state) {
   if(state is UpdatePasswordFailureState){
     showSnackBar(context, content: state.errMessage);
   }
   if(state is UpdatePasswordSuccessState){
     showSnackBar(context, content: state.message);
     navigate(context: context, route: Routes.congratulationScreen);
   }
  },
  builder: (context, state) {
    return Form(
      key: formKey,
      child: CustomPassViews(
          centerWidget:
          Column(
            children: [
              DefaultTextFormField(
                controller: context.read<UpdatePasswordCubit>().currentPassword,
                obscureValue:isNotShowed1,
                hintText: 'enter your current password'.tr(context),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon:IconButton(
                  icon:isNotShowed1?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                  onPressed: (){
                    isNotShowed1=!isNotShowed1;
                    setState(() {});
                  },),
              ),
              SizedBox(height: height*0.02,),
              DefaultTextFormField(
                controller: context.read<UpdatePasswordCubit>().newPassword,
                obscureValue:isNotShowed2,
                hintText: 'enterNewpassword'.tr(context),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon:IconButton(
                  icon:isNotShowed2?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                  onPressed: (){
                    isNotShowed2=!isNotShowed2;
                    setState(() {});
                  },),
              ),
              SizedBox(height: height*0.02,),
              DefaultTextFormField(
                controller: context.read<UpdatePasswordCubit>().confirmPassword,
                obscureValue:isNotShowed3,
                hintText: 'confirmYourpassword'.tr(context),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon:IconButton(
                  icon:isNotShowed3?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                  onPressed: (){
                    isNotShowed3=!isNotShowed3;
                    setState(() {});
                  },),
              ),
              SizedBox(height: height*0.02,),
             state is UpdatePasswordLoadingState?CircularProgressIndicator(): CustomElevatedButton(
                  child: Text("change".tr(context))
                  , onpress: (){
                    if(formKey.currentState!.validate()) {
                      context.read<UpdatePasswordCubit>().updatePassword();
                    }
                  },
               buttonBackground: AppColors.primary,
                  )
            ],
          ),
          mainTitle: 'createNewPassword'.tr(context),
          subTitle: 'yourNewPasswordShouldbedifferent'.tr(context),


      ),
    );
  },
);
  }
}
