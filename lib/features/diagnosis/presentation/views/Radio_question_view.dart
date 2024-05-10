import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';
import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_container.dart';
import 'package:graduation_project/features/diagnosis/data/manager/question_diagnosis_cubit.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/colors.dart';


class QuestionChoice extends StatefulWidget {
   QuestionChoice({Key? key,required this.answersList, required this.QuestionTitle,this.showButton=false}) : super(key: key);
   String QuestionTitle;
      List<String> answersList = [];
      bool showButton;
      int? selectedAnswerIndex;

  @override
  State<QuestionChoice> createState() => QuestionChoiceState();
}
int? selectedLocalizationIndex;
int? selectedTobaccoUseIndex;
int? selectedAlcoholConsumptionIndex;
int? selectedSunExposureIndex;
int? selectedGenderIndex;
int? selectedAgeGroupIndex;
int? selectedUlcersLastsMoreThan3WeeksIndex;
int? selectedUlcersSpreadingIndex;

class QuestionChoiceState extends State<QuestionChoice> {

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width*0.35;
    return CustomFormContainer(
            borderRadius:  BorderRadius.all(Radius.circular(40.r)),
            height: 500.h,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding:  EdgeInsetsDirectional.all(16.0),
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
                        groupValue:widget.selectedAnswerIndex,
                        onChanged: (val) {
                          setState(() {
                             widget.selectedAnswerIndex = val!;
                             switch (widget.QuestionTitle) {
                               case 'Localization':
                                 selectedLocalizationIndex = val;
                                 break;
                               case 'Tobacco Use':
                                 selectedTobaccoUseIndex = val;
                                 break;
                               case 'Alcohol Consumption':
                                 selectedAlcoholConsumptionIndex = val;
                                 break;
                               case 'Sun Exposure':
                                 selectedSunExposureIndex = val;
                                 break;
                               case 'Gender':
                                 selectedGenderIndex = val;
                                 break;
                               case 'Age Group':
                                 selectedAgeGroupIndex = val;
                                 break;
                               case 'Ulcers Lasts More Than 3 Weeks':
                                 selectedUlcersLastsMoreThan3WeeksIndex = val;
                                 break;
                               case 'Ulcers Spreading':
                                 selectedUlcersSpreadingIndex = val;
                                 break;
                             }
                          });
                        },
                      ),
                    )
                        .toList(),
                  ), SizedBox(height: 40.h,),

                     widget.showButton? CustomElevatedButton(
                       width: width,
                       onpress: (){
                         BlocProvider.of<QuestionDiagnosisCubit>(context).
                         questionDiagnosis(
                             localization:selectedLocalizationIndex!, tobacoUse: selectedTobaccoUseIndex!,
                             alcholConsumption:selectedAlcoholConsumptionIndex!, sunExposure: selectedSunExposureIndex!,
                             gender:selectedGenderIndex!, ageGroup:selectedAgeGroupIndex!,
                             ulcersLastsMoreThan3Weeks:selectedUlcersLastsMoreThan3WeeksIndex!,ulcersSpreading:selectedUlcersSpreadingIndex!
                         );
                         navigate(context: context, route: Routes.result);
                      },
                       buttonBackground: AppColors.white, child:
                     Row(
                         children: [
                           Text("showresult".tr(context),style: AppTextStyles.font12.copyWith(color: AppColors.primary),),Icon(Icons.arrow_forward,color: AppColors.primary,),]),):SizedBox()
                ],
              ),
            ),



    );
  }
}