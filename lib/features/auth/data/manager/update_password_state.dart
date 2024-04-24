part of 'update_password_cubit.dart';

@immutable
abstract class UpdatePasswordState {}

class UpdatePasswordInitial extends UpdatePasswordState {}
class UpdatePasswordLoadingState extends UpdatePasswordState {}
class UpdatePasswordSuccessState extends UpdatePasswordState {
  UpdatePasswordSuccessState(this.message);
  final String message;
}
class UpdatePasswordFailureState extends UpdatePasswordState {
  UpdatePasswordFailureState(this.errMessage);
  final String errMessage;
}
