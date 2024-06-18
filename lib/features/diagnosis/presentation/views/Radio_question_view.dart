import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';
import 'package:graduation_project/core/widgets/custom_ques_container.dart';
import 'package:graduation_project/features/auth/presentation/widgets/custom_form_container.dart';
import 'package:graduation_project/features/diagnosis/presentation/cubits/questions_cubit/question_diagnosis_cubit.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../auth/presentation/widgets/custom_questions_container.dart';


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
    return CustomQuestionContainer(
      image:AssetImage(ImageConstants.quesBackground)
          ,  borderRadius:  BorderRadius.all(Radius.circular(40.r)),
            height: 500.h,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding:  EdgeInsetsDirectional.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(height: 20.h,),
                   Text(widget.QuestionTitle,style: AppTextStyles.font24.copyWith(color: AppColors.primary),textAlign: TextAlign.center,),
                   SizedBox(height: 20.h,),
                   Column(
                     children: widget.answersList.map(
                          (answer) => RadioListTile(

                          activeColor: AppColors.primary,
                          title: Text(answer
                          ,style: AppTextStyles.font20.copyWith(color: AppColors.primary),
                        ),
                        value: widget.answersList.indexOf(answer),
                        groupValue:widget.selectedAnswerIndex,
                        onChanged: (val) {
                          setState(() {
                            handleOnChangedRadioButton(val!);

                          });
                        },
                      ),
                    )
                        .toList(),
                  ), SizedBox(height: 40.h,),

                     widget.showButton? CustomElevatedButton(
                       width: width,
                       onpress: () {
                         handleShowResultButton();

                       }
                      , buttonBackground: AppColors.white, child:
                     Row(
                         children: [
                           Text("showresult".tr(context),style: AppTextStyles.font12.copyWith(color: AppColors.primary),),Icon(Icons.arrow_forward,color: AppColors.primary,),]),):SizedBox()
                ],
              ),
            ),



    );
  }
  nullAllIndices(){
    selectedLocalizationIndex=null;
    selectedTobaccoUseIndex=null;
    selectedAlcoholConsumptionIndex=null;
    selectedSunExposureIndex=null;
    selectedGenderIndex=null;
    selectedAgeGroupIndex=null;
    selectedUlcersLastsMoreThan3WeeksIndex=null;
    selectedUlcersSpreadingIndex=null;
  }

  handleShowResultButton(){
    if (selectedLocalizationIndex == null ||
        selectedTobaccoUseIndex == null ||
        selectedAlcoholConsumptionIndex == null ||
        selectedSunExposureIndex == null ||
        selectedGenderIndex == null ||
        selectedAgeGroupIndex == null ||
        selectedUlcersLastsMoreThan3WeeksIndex == null ||
        selectedUlcersSpreadingIndex == null) {
      showSnackBar(context,
          content: 'ThereisaQuestionYouDidnotAnswer'.tr(context),
          contentColor: AppColors.primary);
      return;
    }
    else {
      BlocProvider.of<QuestionDiagnosisCubit>(context).
      questionDiagnosis(
          context,
          localization: selectedLocalizationIndex,
          tobacoUse: selectedTobaccoUseIndex,
          alcholConsumption: selectedAlcoholConsumptionIndex,
          sunExposure: selectedSunExposureIndex,
          gender: selectedGenderIndex,
          ageGroup: selectedAgeGroupIndex,
          ulcersLastsMoreThan3Weeks: selectedUlcersLastsMoreThan3WeeksIndex,
          ulcersSpreading: selectedUlcersSpreadingIndex
      );
      navigate(context: context, route: Routes.result);
      nullAllIndices();
    }
  }

  handleOnChangedRadioButton(int val){
    widget.selectedAnswerIndex = val;
    switch (widget.QuestionTitle) {
      case "Where is the localization of the ulcer ?":
        selectedLocalizationIndex = val;
        break;
      case "Do you use tobacco?":
        selectedTobaccoUseIndex = val;
        break;
      case "Do you consume Alcohol?":
        selectedAlcoholConsumptionIndex = val;
        break;
      case "Do you get exposed to sun ?":
        selectedSunExposureIndex = val;
        break;
      case "What is your gender?":
        selectedGenderIndex = val;
        break;
      case  "What is your age?":
        selectedAgeGroupIndex = val;
        break;
      case "Do the ulcer last more than 3 weeks?":
        selectedUlcersLastsMoreThan3WeeksIndex = val;
        break;
      case "Do the ulcer spread?":
        selectedUlcersSpreadingIndex = val;
        break;
    }
  }
}