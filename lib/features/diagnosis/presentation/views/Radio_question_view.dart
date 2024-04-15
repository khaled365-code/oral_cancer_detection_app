import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    double width=MediaQuery.of(context).size.width*0.35;
    return CustomFormContainer(
            borderRadius:  BorderRadius.all(Radius.circular(40.r)),
            height: 500.h,
            width: ScreenUtil().screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              //  Text("$questionCounter /9",textAlign: TextAlign.center,style: AppTextStyles.font18.copyWith(color: AppColors.primary,))
                 SizedBox(height: 20.h,),
                 Text(widget.QuestionTitle,style: AppTextStyles.font24.copyWith(color: AppColors.white),textAlign: TextAlign.center,),
                 SizedBox(height: 20.h,),
                Column(
                  children: widget.answersList
                      .map(
                        (answer) => RadioListTile(
                      activeColor: AppColors.white,

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
                ), SizedBox(height: 40.h,),
                // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                   // CustomElevatedButton( onpress: (){},buttonBackground: AppColors.primary, child: const Row(children: [Icon(Icons.arrow_back_outlined),Text("Back")],),),
                   widget.showButton? CustomElevatedButton(
                     width: width,
                     onpress: (){
                      navigate(context: context, route: Routes.result);
                    },
                     buttonBackground: AppColors.white, child:
                   Row(
                       children: [
                         Text("Show Result",style: AppTextStyles.font12.copyWith(color: AppColors.primary),),Icon(Icons.arrow_forward,color: AppColors.primary,),]),):SizedBox()
                //   ],
                // )

              ],
            ),



    );
  }
}