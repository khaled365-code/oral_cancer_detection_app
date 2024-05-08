part of 'question_diagnosis_cubit.dart';

@immutable
abstract class QuestionDiagnosisState {}

class QuestionDiagnosisInitial extends QuestionDiagnosisState {}
class QuestionDiagnosisSuccessState extends QuestionDiagnosisState {}
class QuestionDiagnosisLoadingState extends QuestionDiagnosisState {}
