import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repo/ai_repo.dart';
part 'question_diagnosis_state.dart';

class QuestionDiagnosisCubit extends Cubit<QuestionDiagnosisState> {
  QuestionDiagnosisCubit({required this.aiRepository}) : super(QuestionDiagnosisInitial());
 final AiRepository aiRepository;

  dynamic modelResult;

  questionDiagnosis({int? localization, int? tobacoUse,
    int?  alcholConsumption, int? sunExposure,
    int? gender,int? ageGroup,
    int? ulcersLastsMoreThan3Weeks, int? ulcersSpreading,
  })async{
    emit(QuestionDiagnosisLoadingState());
    try {
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
      emit(QuestionDiagnosisFailureState());
      }
    }

    String ConvertToClassName(){
      if(modelResult == 2){
        return 'Leukoplakia without dysplasia';
      }
      else if (modelResult == 1){
        return 'Leukoplakia with dysplasia';
      }
      else return 'OSCC';

    }
  }

