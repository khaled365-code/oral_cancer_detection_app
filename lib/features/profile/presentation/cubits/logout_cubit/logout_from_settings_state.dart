part of 'logout_from_settings_cubit.dart';

@immutable
abstract class LogoutFromSettingsState {}

class LogoutFromSettingsInitial extends LogoutFromSettingsState {}

class LogoutFromSettingsLoadingState extends LogoutFromSettingsState {}


class LogoutFromSettingsFailureState extends LogoutFromSettingsState {
  final String errorMessage;

  LogoutFromSettingsFailureState({required this.errorMessage});


}


class LogoutFromSettingsSuccessState extends LogoutFromSettingsState {

  final String successMessage;

  LogoutFromSettingsSuccessState({required this.successMessage});

}

class SetLogoutToNullState extends LogoutFromSettingsState {}


