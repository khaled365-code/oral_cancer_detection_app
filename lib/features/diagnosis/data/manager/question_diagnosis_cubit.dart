import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:meta/meta.dart';
import '../../../../core/routes/routes.dart';
import '../../presentation/views/Radio_question_view.dart';
import '../repo/ai_repo.dart';
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
      if(modelResult == 2){
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


}

