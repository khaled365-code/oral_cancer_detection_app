import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_appbar.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_container.dart';
import 'package:intl/intl.dart';
import 'componants/date_function.dart';
import 'componants/gender_textfield.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isSecured=true;
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
      padding: const EdgeInsets.only(top: 8),
      child: Scaffold(
        appBar:const PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child:CustomFormAppBar()
           ),
        body: Padding(
          padding: const EdgeInsets.only(top:8),
          child: Form (
            key: formKey,
            child:CustomFormContainer(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 20,right: 16,left: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                     const Text('Register With Us!',
                        style:AppTextStyles.font18
                      ),
                      const SizedBox(height:5,),
                      const Text('Your information is safe with us',
                        style:AppTextStyles.font16,
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
                            icon:const Icon(Icons.calendar_month)) ,
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
                          icon:isSecured?const Icon(Icons.visibility_off):
                          const Icon(Icons.visibility) ,),
                      ),
                      const SizedBox(height:10,),
                      CustomTextFormField(labelText: 'Confirm password', hintText:'Confirm password',
                        suffixIcon:IconButton(
                          onPressed: (){
                          isSecured=!isSecured ;
                          setState(() {});
                        },
                          icon:isSecured?const Icon(Icons.visibility_off):
                          const Icon(Icons.visibility) ,),),
                      const SizedBox(height:17,),
                      CustomButton(buttonText:'Sign Up' ,
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
                          const Text("Already have an account?",
                          style: AppTextStyles.font14,),
                          GestureDetector(
                            onTap: (){
                              navigate(context: context, route: Routes.logAs);
                            },
                            child:Text('Login',
                              style:AppTextStyles.font14.copyWith(
                                  color: AppColors.primary,
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
               ),

          ),

    );
  }
}

