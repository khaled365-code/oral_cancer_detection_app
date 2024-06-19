part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}


class SignInLoadingState extends SignInState {}
class SignInSuccessState extends SignInState {
  SignInSuccessState({required this.message});

  final String message;
}
class SignInFailureState extends SignInState {
  final String errMessage;
  SignInFailureState({ required this.errMessage});
}
