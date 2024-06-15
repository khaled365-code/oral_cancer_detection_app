part of 'image_diagnosis_cubit.dart';

@immutable
sealed class ImageDiagnosisState {}

final class ImageDiagnosisInitial extends ImageDiagnosisState {}
final class ImageDiagnosisLoadingState extends ImageDiagnosisState {}
final class ImageDiagnosisFailureState extends ImageDiagnosisState {
  ImageDiagnosisFailureState({required this.errMessage});
  final String errMessage;
}
final class ImageDiagnosisSuccessState extends ImageDiagnosisState {}