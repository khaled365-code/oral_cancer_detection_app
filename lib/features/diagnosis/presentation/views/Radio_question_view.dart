import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';
import '../../../../core/utilis/app_colors.dart';


class QuestionChoice extends StatefulWidget {
  const QuestionChoice({Key? key}) : super(key: key);

  @override
  State<QuestionChoice> createState() => QuestionChoiceState();
}

class QuestionChoiceState extends State<QuestionChoice> {
  int questionCounter=1;
  int? selectedAnswerIndex;
  List<String> answersList = [
    'Yes',
    'No',
    'Former',
    'Not Informed',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("$questionCounter /9",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primary),)
              ,const SizedBox(height: 20,),
              const Text(" Do You use tobacco?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
              const SizedBox(height: 20,),
              Column(
                children: answersList
                    .map(
                      (answer) => RadioListTile(
                    activeColor: AppColors.primary,

                    title: Text(answer
                      ,style: const TextStyle(fontSize: 20),
                    ),
                    value: answersList.indexOf(answer),
                    groupValue: selectedAnswerIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswerIndex = value;
                      });
                    },
                  ),
                )
                    .toList(),
              ),const SizedBox(height: 40,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomElevatedButton( onpress: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.primary)), child: const Row(children: [Icon(Icons.arrow_back_outlined),Text("Back")],),),
                  CustomElevatedButton( onpress: (){
                    navigate(context: context, route: Routes.textQuestion);
                  },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.primary)), child:  const Row(children: [Text("Next"),Icon(Icons.arrow_forward),]),)
                ],
              )

            ],),
        ),
      ),
    );
  }
}