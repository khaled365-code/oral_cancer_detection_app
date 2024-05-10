import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repo/ai_repo.dart';
part 'question_diagnosis_state.dart';

class QuestionDiagnosisCubit extends Cubit<QuestionDiagnosisState> {
  QuestionDiagnosisCubit({required this.aiRepository}) : super(QuestionDiagnosisInitial());
 final AiRepository aiRepository;

 // int? localization;
 // int? tobacoUse;
 // int? alcholConsumption;
 // int? sunExposure;
 // int? gender;
 // int? ageGroup;
 // int? ulcersLastsMoreThan3Weeks=0;
 // int? ulcersSpreading;

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
      
      print(response.prediction);
      emit(QuestionDiagnosisSuccessState(response.prediction));
    }
    catch (error) {
      emit(QuestionDiagnosisFailureState());
      }
    }
  }

