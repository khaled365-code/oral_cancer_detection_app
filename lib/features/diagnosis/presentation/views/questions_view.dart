import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/Radio_question_view.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/text_question_view.dart';
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
                      labelColor: AppColors.primary,
                      indicatorColor: AppColors.primary,
                        unselectedLabelColor: Colors.black,
                      labelPadding:  EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                      tabs:  [
                        Tab(text: "first".tr(context),),
                        // Tab(text: "second".tr(context),),
                        Tab(text: "second".tr(context),),
                        Tab(text: "third".tr(context),),
                        Tab(text: "fourth".tr(context),),
                        Tab(text: "fifth".tr(context),),
                        Tab(text: "sixth".tr(context),),
                        Tab(text: "seventh".tr(context),),
                        Tab(text: "eighth".tr(context),),
                      ]),
                    Flexible(
                    flex: 1,
                    child: TabBarView(children:[
                      QuestionChoice(answersList:  ['Tongue'.tr(context),'Lip'.tr(context),'Floor of mouth'.tr(context),'Palate'.tr(context),"Gingiva".tr(context)], QuestionTitle: 'ًWhereisthelocalizationoftheulcer ?'.tr(context),),
                      // const QuestionText(),
                      QuestionChoice(answersList:  ['Yes'.tr(context),'No'.tr(context),'Former'.tr(context),'NotInformed'.tr(context)], QuestionTitle: 'Doyouusetobacco?'.tr(context),),
                      QuestionChoice(answersList:  ['Yes'.tr(context),'No'.tr(context),'Former'.tr(context),'NotInformed'.tr(context)], QuestionTitle: 'DoyouconsumeAlcohol?'.tr(context),),
                      QuestionChoice(answersList:  ['Yes'.tr(context),'No'.tr(context),'NotInformed'.tr(context)], QuestionTitle: 'Doyougetexposedtosun?'.tr(context),),
                      QuestionChoice(answersList:  ['Male'.tr(context),'Female'.tr(context)], QuestionTitle: 'Whatisyougender?'.tr(context),),
                      QuestionChoice(answersList:  ['lessthan40years'.tr(context) ,'between41and60years'.tr(context),'greaterthan60'.tr(context),], QuestionTitle: 'Whatisyourage?'.tr(context),),
                      QuestionChoice(answersList:  ['Yes'.tr(context),'No'.tr(context)], QuestionTitle: 'Do the ulcer last more than 3 weeks?',),
                      QuestionChoice(answersList:  ['Yes'.tr(context),'No'.tr(context)], QuestionTitle: 'Dotheulcerspread?'.tr(context),showButton: true,),
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
