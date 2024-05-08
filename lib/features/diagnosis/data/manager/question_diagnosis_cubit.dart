import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repo/ai_repo.dart';

part 'question_diagnosis_state.dart';

class QuestionDiagnosisCubit extends Cubit<QuestionDiagnosisState> {
  QuestionDiagnosisCubit({required this.aiRepository}) : super(QuestionDiagnosisInitial());
 final AiRepository aiRepository;

final int localization=0;
final int tobacoUse=0;
final int alcholConsumption=0;
final int sunExposure=0;
final int gender=0;
final int ageGroup=0;
final int ulcersLastsMoreThan3Weeks=0;
final int ulcersSpreading=0;

  questionDiagnosis()async{
    emit(QuestionDiagnosisSuccessState());
    final response=await aiRepository.questionDiagnose(
        localization: localization,
        tobacoUse: tobacoUse,
        alcholConsumption: alcholConsumption,
        sunExposure: sunExposure,
        gender: gender,
        ageGroup: ageGroup,
        ulcersLastsMoreThan3Weeks: ulcersLastsMoreThan3Weeks,
        ulcersSpreading: ulcersSpreading);
    emit(QuestionDiagnosisSuccessState());
  }


}
