import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/Radio_question_view.dart';
import 'package:graduation_project/features/diagnosis/presentation/widgets/tab_bar_container.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 8,
      child: SafeArea(
            child: Scaffold(
              body: Padding(
                padding:  EdgeInsetsDirectional.all(8.0),
                child: Column(
                  children: [
                      TabBar(

                      labelStyle:AppTextStyles.font15.copyWith(fontWeight: FontWeight.bold),
                      isScrollable: true,
                      labelColor: AppColors.white,
                      indicatorColor: AppColors.primary,
                        unselectedLabelColor: Colors.black,
                      labelPadding:  EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                      tabs:  [
                        Tab(child: TabBarContainer(text: "first".tr(context)))
                        // Tab(text: "second".tr(context),),
                       , Tab(child: TabBarContainer(text: "second".tr(context))),
                        Tab(child: TabBarContainer(text: "third".tr(context)),),
                        Tab(child: TabBarContainer(text:"fourth".tr(context))),
                        Tab(child: TabBarContainer(text: "fifth".tr(context))),
                        Tab(child: TabBarContainer(text: "sixth".tr(context))),
                        Tab(child: TabBarContainer(text: "seventh".tr(context)),),
                        Tab(child: TabBarContainer(text:"eighth".tr(context))),
                      ]),
                    Flexible(
                    flex: 1,
                    child: TabBarView(children:[
                      QuestionChoice(answersList:  ['Tongue'.tr(context),'Lip'.tr(context),'Floor of mouth'.tr(context),'Palate'.tr(context),"Gingiva".tr(context)], QuestionTitle:'Localization'),
                      QuestionChoice(answersList:  ['Yes'.tr(context),'Former'.tr(context),'No'.tr(context),'NotInformed'.tr(context)], QuestionTitle:'Tobacco Use'),
                      QuestionChoice(answersList:  ['No'.tr(context),'Former'.tr(context),'Yes'.tr(context),'NotInformed'.tr(context)], QuestionTitle:'Alcohol Consumption'),
                      QuestionChoice(answersList:  ['No'.tr(context),'Yes'.tr(context),'NotInformed'.tr(context)], QuestionTitle: 'Sun Exposure'),
                      QuestionChoice(answersList:  ['Male'.tr(context),'Female'.tr(context)], QuestionTitle:'Gender'),
                      QuestionChoice(answersList:  ['greaterthan60'.tr(context) ,'between41and60years'.tr(context),'lessthan40years'.tr(context),], QuestionTitle: 'Age Group'),
                      QuestionChoice(answersList:  ['No'.tr(context),'Yes'.tr(context)], QuestionTitle: 'Ulcers Lasts More Than 3 Weeks'),
                      QuestionChoice(answersList:  ['No'.tr(context),'Yes'.tr(context)], QuestionTitle:'Ulcers Spreading',showButton: true),
                    ]
                    )
                )
                  ]
                ),
              )
            ),
          ),
    );
  }
}
