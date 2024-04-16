part of 'change_language_cubit.dart';

@immutable
abstract class ChangeLanguageState {}

class ChangeLanguageInitial extends ChangeLanguageState {}
class ChangeLanguageSuccessState extends ChangeLanguageState {
  ChangeLanguageSuccessState({required this.userMessage});
  final String userMessage;
}
