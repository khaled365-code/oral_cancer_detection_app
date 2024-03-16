import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_textformfield.dart';
import 'package:graduation_project/core/widgets/row_title.dart';

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
        appBar:AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.background,
          title: const RowTitle(),
          titleSpacing: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:8),
          child: Form (
            key: formKey,
            child: Center(
              child: Container(
                height: double.infinity,
                width:double.infinity,
                decoration:BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius:const BorderRadius.only(
                    topRight:Radius.circular(40),
                    topLeft:Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,right: 16,left: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text('Register With Us!',
                          style:TextStyle(fontSize:18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height:5,),
                        const Text('Your information is safe with us',
                          style:TextStyle(fontSize:16,),
                        ),
                        const SizedBox(height:16,),
                        const CustomTextFormField(labelText:'UserName', hintText:'Enter your name'),
                        const SizedBox(height:10,),
                        const GenderSelectTextField(),
                        const SizedBox(height:10,),
                        CustomTextFormField(labelText:'Date of Birth', hintText:'mm/dd/yyyy',
                          controller: dateController,
                          suffixIcon:IconButton(onPressed:_selectDate,
                              icon:const Icon(Icons.calendar_month)) ,
                        ),
                        const SizedBox(height:10,),
                        const CustomTextFormField(labelText:'phone number', hintText:'Enter phone number'),
                        const SizedBox(height:10,),
                        const CustomTextFormField(labelText:'Email', hintText:'Enter your email'),
                        const SizedBox(height:10,),
                        CustomTextFormField(labelText:'password', hintText:'Enter your name',
                          suffixIcon:IconButton(onPressed: (){
                            isSecured=!isSecured ;
                            setState(() {});
                          },
                            icon:isSecured?const Icon(Icons.visibility_off):
                            const Icon(Icons.visibility) ,),
                        ),
                        const SizedBox(height:10,),
                        CustomTextFormField(labelText: 'Confirm password', hintText:'Confirm password',
                          suffixIcon:IconButton(onPressed: (){
                            isSecured=!isSecured ;
                            setState(() {});
                          },
                            icon:isSecured?const Icon(Icons.visibility_off):
                            const Icon(Icons.visibility) ,),),
                        const SizedBox(height:17,),
                        CustomButton(buttonText:'Sign Up' , onTap:(){
                          if(formKey.currentState!.validate()){
                            print('Register done');
                            // here signup user function preformed like chat app
                          }
                        },),
                        const SizedBox(height:5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            GestureDetector(
                              onTap: (){
                                navigate(context: context, route: Routes.logAs);
                              },
                              child:const Text('Login',style:TextStyle(color:AppColors.primary),
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

      ),
    );
  }
}