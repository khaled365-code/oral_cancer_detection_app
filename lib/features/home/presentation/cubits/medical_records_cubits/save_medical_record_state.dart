part of 'save_medical_record_cubit.dart';

@immutable
sealed class SaveMedicalRecordState {}

final class SaveMedicalRecordInitial extends SaveMedicalRecordState {}
final class SaveMedicalRecordIconChange extends SaveMedicalRecordState {}
final class SaveMedicalRecordSuccess extends SaveMedicalRecordState {
  SaveMedicalRecordSuccess({required this.successMessage});
  String successMessage;
}
final class SaveMedicalRecordFailure extends SaveMedicalRecordState {
  SaveMedicalRecordFailure(this.errMessage);
  final String errMessage;
}
