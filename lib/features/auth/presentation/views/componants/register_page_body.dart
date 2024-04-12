import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
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

    return Padding(
      padding: const EdgeInsets.only(top:80),
      child: Column(
        children: [
          const SizedBox(height: 100,),
          Form (
            key: formKey,
            child:EmptyContainer(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,right: 16,left: 16),
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('Register With Us!',
                            style:AppTextStyles.font18.copyWith(
                              color: AppColors.background ,
                            ),
                        ),
                        const SizedBox(height:5,),
                        Text('Your information is safe with us',
                          style:AppTextStyles.font16.copyWith(
                            color: AppColors.background ,
                          ),
                        ),
                        const SizedBox(height:16,),
                        const CustomTextFormField(labelText:'UserName', hintText:'Enter your name'),
                        const SizedBox(height:10,),
                        const GenderSelectTextField(),
                        const SizedBox(height:10,),
                        CustomTextFormField(labelText:'Date of Birth', hintText:'mm/dd/yyyy',
                          readOnly: true,
                          controller: dateController,
                          suffixIcon:IconButton(
                              onPressed:_selectDate,
                              icon:const Icon(Icons.calendar_month,color:AppColors.background,)) ,
                        ),
                        const SizedBox(height:10,),
                        const CustomTextFormField(labelText:'phone number', hintText:'Enter phone number'),
                        const SizedBox(height:10,),
                        const CustomTextFormField(labelText:'Email', hintText:'Enter your email'),
                        const SizedBox(height:10,),
                        CustomTextFormField(labelText:'password', hintText:'Enter your name',
                          suffixIcon:IconButton(
                            onPressed: (){
                              isSecured=!isSecured ;
                              setState(() {});
                            },
                            icon:isSecured?
                            const Icon(Icons.visibility_off,color:AppColors.background):
                            const Icon(Icons.visibility,color:AppColors.background) ,),
                        ),
                        const SizedBox(height:10,),
                        CustomTextFormField(labelText: 'Confirm password', hintText:'Confirm password',
                          suffixIcon:IconButton(
                            onPressed: (){
                              isSecuredConf=!isSecuredConf;
                              setState(() {});
                            },
                            icon:isSecuredConf?
                            const Icon(Icons.visibility_off,color:AppColors.background):
                            const Icon(Icons.visibility,color:AppColors.background),)
                          ),
                        const SizedBox(height:17,),
                        CustomButton(
                          buttonBackground: AppColors.background,
                          buttonTextColor: AppColors.primary,
                          buttonText:'Sign Up' ,
                          onTap:(){
                            if(formKey.currentState!.validate()){
                              print('Register done');
                              navigate(context: context, route: Routes.logAs);
                              // here signup user function preformed like chat app
                            }
                          },),
                        const SizedBox(height:5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?",
                              style: AppTextStyles.font14.copyWith(
                                  color:AppColors.background),),
                            GestureDetector(
                              onTap: (){
                                navigate(context: context, route: Routes.logAs);
                              },
                              child:Text('Login',
                                style:AppTextStyles.font14.copyWith(
                                    color: AppColors.background,
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

            ),
        ],
      ),

    );
  }
}