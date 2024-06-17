import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import '../../../../core/utilis/app_colors.dart';
import '../widgets/learnmore_row_widget.dart';

class LearnMoreComponent extends StatelessWidget {
  const LearnMoreComponent({super.key,   required this.firstQuestion, required this.firstAnswer, required this.secondAnswer, required this.thirdAnswer, required this.fourthAnswer,  required this.fifthAnswer, required this.sixthAnswer, required this.seventhAnswer});
  final String firstQuestion;
  final String firstAnswer;
  final String secondAnswer;
  final String thirdAnswer;
  final String fourthAnswer;
  final String fifthAnswer;
  final String sixthAnswer;
  final String seventhAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primary,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Text(firstQuestion,style: AppTextStyles.font16.copyWith(color: AppColors.primary),),
          SizedBox(height: 10.h,),
          LearnMoreRowWidget(text: firstAnswer,isOneAnswer: true,),
          SizedBox(height: 20.h,),
          Text('How to Care Before A Visit ?',style: AppTextStyles.font16.copyWith(color: AppColors.primary),),
          SizedBox(height: 10.h,),
          LearnMoreRowWidget(text: secondAnswer,isOneAnswer: false,),
          SizedBox(height: 10.h,),
          LearnMoreRowWidget(text: thirdAnswer,isOneAnswer: false,),
          SizedBox(height: 10.h,),
          LearnMoreRowWidget(text: fourthAnswer,isOneAnswer: false,),
          SizedBox(height: 20.h,),
          SizedBox(height: 20.h,),
          Text('When to visit a Doctor ?',style: AppTextStyles.font16.copyWith(color: AppColors.primary),),
          SizedBox(height: 10.h,),
          LearnMoreRowWidget(text: fifthAnswer,isOneAnswer: true,),
          SizedBox(height: 20.h,),
          Text('What to ask a Doctor ?',style: AppTextStyles.font16.copyWith(color: AppColors.primary),),
          SizedBox(height: 10.h,),
          LearnMoreRowWidget(text: sixthAnswer,isOneAnswer: false,),
          SizedBox(height: 10.h,),
          LearnMoreRowWidget(text: seventhAnswer,isOneAnswer: false,),




        ],
        ),
      ),
    );
  }
}

