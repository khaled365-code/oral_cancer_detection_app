import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/learn_more_view.dart';
import 'package:graduation_project/features/home/presentation/cubits/medical_records_cubits/get_medical_record_cubit.dart';
import '../../../data/repo/ai_repo.dart';
part 'question_diagnosis_state.dart';

class QuestionDiagnosisCubit extends Cubit<QuestionDiagnosisState> {
  QuestionDiagnosisCubit({required this.aiRepository}) : super(QuestionDiagnosisInitial());
  final AiRepository aiRepository;
  dynamic modelResult;

  questionDiagnosis(BuildContext context,
      {int? localization, int? tobacoUse,
        int?  alcholConsumption, int? sunExposure,
        int? gender,int? ageGroup,
        int? ulcersLastsMoreThan3Weeks, int? ulcersSpreading,
      })async{
    try {

      emit(QuestionDiagnosisLoadingState());
      final response=await aiRepository.questionDiagnose(
          localization:localization!,
          tobacoUse: tobacoUse!,
          alcholConsumption: alcholConsumption!,
          sunExposure:sunExposure!,
          gender:gender!,
          ageGroup:ageGroup!,
          ulcersLastsMoreThan3Weeks:ulcersLastsMoreThan3Weeks!,
          ulcersSpreading: ulcersSpreading!
      );
      print(response.prediction[0]);
      modelResult=response.prediction[0];
      emit(QuestionDiagnosisSuccessState(response.prediction[0]));

    }
    catch (error) {
      emit(QuestionDiagnosisFailureState(" try later "));
    }
  }


  String ConvertToDiseaseName(BuildContext context){

    if(modelResult == 2 ){
      return 'LeukoplakiaWithoutDysplasia'.tr(context);
    }
    else if (modelResult == 1){
      return 'leukoplakiaWithDysplasia'.tr(context);
    }
    else return 'OSCC'.tr(context);


  }

  String ConvertToClassName(BuildContext context){
    if(modelResult == 2 || modelResult == 1 ){
      return 'NonCancer'.tr(context);

    }
    else return 'Cancer'.tr(context);

  }
  navigationToLearnMore(BuildContext context){
    if(modelResult == 2){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>
          LearnMoreComponent(firstQuestion: 'What is Leukoplakia Without Dysplasia ?', firstAnswer: 'Leukoplakia without dysplasia is a white or gray patch that forms on the tongue, gums, or inner cheek, which is not associated with precancerous changes.',
            secondAnswer: 'Avoid tobacco and alcohol use, as they can worsen leukoplakia.',
            thirdAnswer: 'Maintain good oral hygiene by brushing teeth twice a day and flossing daily.',
            fourthAnswer: 'Monitor the leukoplakia patch for any changes in size, shape, or color.',
            fifthAnswer: 'It is essential to visit a doctor promptly if the leukoplakia patch persists for more than two weeks or shows any signs of growth or changes in appearance.',
            sixthAnswer: 'Is a biopsy necessary to confirm the diagnosis ?',
            seventhAnswer: 'What are the signs or symptoms that indicate the need for further evaluation or treatment ?'
            ,)));
    }
    else if (modelResult == 1){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreComponent(
        firstQuestion: 'What is Leukoplakia With Dysplasia ?',
        firstAnswer: 'Leukoplakia with dysplasia is a precancerous condition where the white or gray patch on the tongue, gums, or inner cheek shows abnormal  changes that indicate an increased risk of developing oral cancer.',
        secondAnswer: 'Avoid tobacco and alcohol use completely.',
        thirdAnswer: 'Maintain excellent oral hygiene by brushing teeth twice a day and flossing daily.',
        fourthAnswer: 'Schedule an appointment with a doctor or dentist as soon as possible for a thorough evaluation.',
        fifthAnswer: 'It is crucial to visit a doctor promptly if you notice leukoplakia with dysplasia, as it indicates a higher risk of developing oral cancer. Immediate medical attention is necessary for proper diagnosis.',
        sixthAnswer: 'What are the treatment options for leukoplakia with dysplasia ?',
        seventhAnswer: 'What are the long-term risks and prognosis associated with leukoplakia with dysplasia ?'
        ,)));
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreComponent(
        firstQuestion: 'What is OSCS ?',
        firstAnswer: 'Oral cancer refers to the abnormal growth of cells in the oral cavity, including the lips, tongue, gums, cheeks, and roof or floor of the mouth, it is dangerous disease so you should take care.',
        secondAnswer: 'Refrain from tobacco and alcohol use, as they are significant risk factors for oral cancer.',
        thirdAnswer: 'Pay attention to any persistent symptoms such as mouth sores, difficulty swallowing, or changes in voice.',
        fourthAnswer: 'Maintain good oral hygiene and regularly inspect your mouth for any unusual growths or lesions.',
        fifthAnswer:" immediately, if you notice  symptoms, as mouth sores that don't heal, white or red patches, pain or numbness in the mouth, difficulty swallowing or chewing, or changes in voice.",
        sixthAnswer: 'What are the available treatment options for oral cancer ?',
        seventhAnswer: 'Are there any support groups or resources available for patients with oral cancer ?',)));
    }
  }


}