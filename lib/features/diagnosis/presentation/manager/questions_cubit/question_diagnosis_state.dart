part of 'question_diagnosis_cubit.dart';

@immutable
abstract class QuestionDiagnosisState {}

class QuestionDiagnosisInitial extends QuestionDiagnosisState {}

class QuestionDiagnosisSuccessState extends QuestionDiagnosisState {
  final List<dynamic> prediction;

  QuestionDiagnosisSuccessState(this.prediction);
}

class QuestionDiagnosisLoadingState extends QuestionDiagnosisState {}

class QuestionDiagnosisFailureState extends QuestionDiagnosisState {
  final String errorMessage;

  QuestionDiagnosisFailureState(this.errorMessage);
}
