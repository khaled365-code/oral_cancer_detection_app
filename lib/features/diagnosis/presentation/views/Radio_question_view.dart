import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_container.dart';
import '../../../../core/utilis/app_colors.dart';


class QuestionChoice extends StatefulWidget {
   QuestionChoice({Key? key,required this.answersList, required this.QuestionTitle,this.showButton=false}) : super(key: key);
   String QuestionTitle;
      List<String> answersList = [];
      bool showButton;

  @override
  State<QuestionChoice> createState() => QuestionChoiceState();
}

class QuestionChoiceState extends State<QuestionChoice> {
  int questionCounter=1;
  int? selectedAnswerIndex;


  @override
  Widget build(BuildContext context) {
    return CustomFormContainer(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            height: 500,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              //  Text("$questionCounter /9",textAlign: TextAlign.center,style: AppTextStyles.font18.copyWith(color: AppColors.primary,))
                const SizedBox(height: 20,),
                 Text(widget.QuestionTitle,style: AppTextStyles.font24.copyWith(color: AppColors.primary),textAlign: TextAlign.center,),
                const SizedBox(height: 20,),
                Column(
                  children: widget.answersList
                      .map(
                        (answer) => RadioListTile(
                      activeColor: AppColors.primary,

                      title: Text(answer
                        ,style: AppTextStyles.font20,
                      ),
                      value: widget.answersList.indexOf(answer),
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
                // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                   // CustomElevatedButton( onpress: (){},buttonBackground: AppColors.primary, child: const Row(children: [Icon(Icons.arrow_back_outlined),Text("Back")],),),
                   widget.showButton? CustomElevatedButton(
                     width: 150,
                     onpress: (){
                      navigate(context: context, route: Routes.result);
                    },
                     buttonBackground: AppColors.primary, child:  const Row(children: [Text("Show Result"),Icon(Icons.arrow_forward),]),):SizedBox()
                //   ],
                // )

              ],
            ),



    );
  }
}