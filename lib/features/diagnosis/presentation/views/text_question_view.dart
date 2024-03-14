import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/custom_textformfield.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("2 /26",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primary),),
            const SizedBox(height: 30,),
            const Text(" What is the size of ulcer?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),

            const SizedBox(height: 20,),
            CustomTextFormField(hintText: 'Enter the size',onChangeee: (data){},obscureValue: false,inputType: TextInputType.number,)
            ,
            const SizedBox(height: 40,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton( onpress: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.primary)), child: const Row(children: [Icon(Icons.arrow_back_outlined),Text("Back")],),),
                CustomElevatedButton( onpress: (){
                  navigate(context: context, route: Routes.result);
                },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.primary)), child:  const Row(children: [Text("Next"),Icon(Icons.arrow_forward),]),)
              ],
            )],),
      ),
    );
  }
}
