import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/Radio_question_view.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/text_question_view.dart';
class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 9,
      child: SafeArea(
            child: Scaffold(
              body: Padding(
                padding:  EdgeInsetsDirectional.all(8.0),
                child: Column(
                  children: [
                      TabBar(

                      labelStyle:AppTextStyles.font15.copyWith(fontWeight: FontWeight.bold),
                      isScrollable: true,
                      labelColor: AppColors.primary,
                      indicatorColor: AppColors.primary,
                        unselectedLabelColor: Colors.black,
                      labelPadding:  EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                      tabs: const [
                        Tab(text: "first",),
                        Tab(text: "second",),
                        Tab(text: "third",),
                        Tab(text: "fourth",),
                        Tab(text: "fifth",),
                        Tab(text: "sixth",),
                        Tab(text: "seventh",),
                        Tab(text: "eighth",),
                        Tab(text: "ninth",),
                      ]),
                    Flexible(
                    flex: 1,
                    child: TabBarView(children:[
                      QuestionChoice(answersList: const ['Tongue','Lip','Floor of mouth','Palate',"Gingiva"], QuestionTitle: 'ًWhere is the localization of the ulcer ?',),
                      const QuestionText(),
                      QuestionChoice(answersList: const ['Yes','No','Former','Not Informed'], QuestionTitle: 'Do you use tobacco?',),
                      QuestionChoice(answersList: const ['Yes','No','Former','Not Informed'], QuestionTitle: 'Do you consume Alcohol?',),
                      QuestionChoice(answersList: const ['Yes','No','Not Informed'], QuestionTitle: 'Do you get exposed to sun ?',),
                      QuestionChoice(answersList: const ['Male','Female'], QuestionTitle: 'What is your gender?',),
                      QuestionChoice(answersList: const ['less than 40 years' ,'between 41 and 60 years','greater than 60',], QuestionTitle: 'What is your age?',),
                      QuestionChoice(answersList: const ['Yes','No'], QuestionTitle: 'Do the ulcer last more than 3 weeks?',),
                      QuestionChoice(answersList: const ['Yes','No'], QuestionTitle: 'Do the ulcer spread?',showButton: true,),
                    ]
                    )
                )
                  ]),
              )
            ),
          ),
    );
  }
}
