part of 'change_theme_cubit.dart';

@immutable
abstract class ChangeThemeState {}

class ChangeThemeInitial extends ChangeThemeState {}
class ChangeThemeLoadingState extends ChangeThemeState {}
class ChangeThemeSuccessState extends ChangeThemeState {
  ChangeThemeSuccessState({required this.message});
  final String message;
}
