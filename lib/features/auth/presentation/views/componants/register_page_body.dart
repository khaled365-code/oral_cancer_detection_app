import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import '../../../../../core/commons/functions.dart';

import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_empty_container.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/date_function.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/gender_textfield.dart';
import 'package:intl/intl.dart';

class RegisterBody extends StatefulWidget{
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  bool isSecured=true;
  bool isSecuredConf=true;
  GlobalKey<FormState> formKey=GlobalKey();

  DateTime? birthDate;
  final TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
  Future<void> _selectDate() async {
    final pickedDate = await DateFunction().selectBirthDate(context);
    if (pickedDate != null) {
      setState(() {
        birthDate = pickedDate;
        dateController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
      });
      print('date selected');
    }
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 180.h,),
          EmptyContainer(
            child: Form (
              key: formKey,
              child:Padding(
                padding:EdgeInsetsDirectional.only(top:20.h,end:16.w,start:16.w),
                child:Column(
                  children: [
                    Text('Register With Us!',
                        style:AppTextStyles.font18.copyWith(
                          color: AppColors.background ,
                        ),
                    ),
                    SizedBox(height:5.h,),
                    Text('Your information is safe with us',
                      style:AppTextStyles.font16.copyWith(
                        color: AppColors.background ,
                      ),
                    ),
                    SizedBox(height:16.h,),
                    const CustomTextFormField(labelText:'UserName', hintText:'Enter your name',),
                    SizedBox(height:10.h,),
                    const GenderSelectTextField(),
                    SizedBox(height:10.h,),
                    CustomTextFormField(labelText:'Date of Birth', hintText:'mm/dd/yyyy',
                      readOnly: true,
                      controller: dateController,
                      suffixIcon:IconButton(
                          onPressed:_selectDate,
                          icon:const Icon(Icons.calendar_month,color:AppColors.background,)) ,
                    ),
                    SizedBox(height:10.h,),
                    const CustomTextFormField(labelText:'phone number', hintText:'Enter phone number'),
                    SizedBox(height:10.h,),
                    const CustomTextFormField(labelText:'Email', hintText:'Enter your email'),
                    SizedBox(height:10.h,),
                    CustomTextFormField(labelText:'password', hintText:'Enter your name',
                      obscureValue: isSecured,
                      suffixIcon:IconButton(
                        onPressed: (){
                          isSecured=!isSecured ;
                          setState(() {});
                        },
                        icon:isSecured?
                        const Icon(Icons.visibility_off,color:AppColors.background):
                        const Icon(Icons.visibility,color:AppColors.background) ,),
                    ),
                    SizedBox(height:10.h,),
                    CustomTextFormField(labelText: 'Confirm password', hintText:'Confirm password',
                        obscureValue: isSecuredConf,
                        suffixIcon:IconButton(
                        onPressed: (){
                          isSecuredConf=!isSecuredConf;
                          setState(() {});
                        },
                        icon:isSecuredConf?
                        const Icon(Icons.visibility_off,color:AppColors.background):
                        const Icon(Icons.visibility,color:AppColors.background),)
                      ),
                    SizedBox(height:17.h,),
                    CustomButton(
                      buttonBackground: AppColors.background,
                      buttonTextColor: AppColors.primary,
                      buttonText:'Sign Up' ,
                      onTap:(){

                          navigate(context: context, route: Routes.loginScreen);


                      },),
                    SizedBox(height:8.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                          style: AppTextStyles.font14.copyWith(
                              color:AppColors.background,),),
                        GestureDetector(
                          onTap: (){
                            navigate(context: context, route: Routes.loginScreen);
                          },
                          child:Text('Login',
                            style:AppTextStyles.font14.copyWith(
                                color: AppColors.background,
                                decoration: TextDecoration.underline,
                                fontFamily: 'lato'),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                ),

              ),
          ),
        ],
      ),
    );
  }
}