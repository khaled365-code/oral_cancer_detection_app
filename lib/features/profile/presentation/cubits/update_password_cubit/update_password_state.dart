part of 'update_password_cubit.dart';

@immutable
abstract class UpdatePasswordFromSettingsState {}

class UpdatePasswordInitial extends UpdatePasswordFromSettingsState {}


class UpdatePasswordLoadingState extends UpdatePasswordFromSettingsState {}


class UpdatePasswordFailureState extends UpdatePasswordFromSettingsState {

  final String errorMessage;
  UpdatePasswordFailureState({required this.errorMessage});
}

class UpdatePasswordSuccessState extends UpdatePasswordFromSettingsState {

  final String successMessage;

  UpdatePasswordSuccessState({required this.successMessage});

}

class UpdatePasswordOldPasswordIconState extends UpdatePasswordFromSettingsState {}

class UpdatePasswordNewPasswordIconState extends UpdatePasswordFromSettingsState {}

class UpdatePasswordConfirmNewPasswordIconState extends UpdatePasswordFromSettingsState {}
