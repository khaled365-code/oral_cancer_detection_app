part of 'medical_record_cubit.dart';

@immutable
sealed class MedicalRecordState {}

final class MedicalRecordInitial extends MedicalRecordState {}
final class MedicalRecordSuccess extends MedicalRecordState {}
final class MedicalRecordLoading extends MedicalRecordState {}
final class MedicalRecordFailure extends MedicalRecordState {
  MedicalRecordFailure({required this.errMessage});
  final String errMessage;
}
