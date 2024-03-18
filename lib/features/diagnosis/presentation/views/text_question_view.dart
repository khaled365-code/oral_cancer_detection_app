import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
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
             Text("2 /9",style: AppTextStyles.font18.copyWith(color: AppColors.primary)),
            const SizedBox(height: 30,),
            const Text(" What is the size of ulcer?",style: AppTextStyles.font24,),

            const SizedBox(height: 20,),
            CustomTextFormField(hintText: 'Enter the size',onChangeee: (data){},obscureValue: false,inputType: TextInputType.number,)
            ,
            const SizedBox(height: 40,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton( onpress: (){},buttonBackground: AppColors.primary, child: const Row(children: [Icon(Icons.arrow_back_outlined),Text("Back")],),),
                CustomElevatedButton( onpress: (){
                  navigate(context: context, route: Routes.result);
                },
                buttonBackground: AppColors.primary, child:  const Row(children: [Text("Next"),Icon(Icons.arrow_forward),]),)
              ],
            )],),
      ),
    );
  }
}
