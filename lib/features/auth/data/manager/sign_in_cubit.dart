import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../repos/auth_repos.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepos) : super(SignInInitial());

  AuthRepos authRepos;
  TextEditingController signInEmail=TextEditingController();
  TextEditingController signInPassword=TextEditingController();



  signIn()async{
    emit(SignInLoadingState());
    final response=await authRepos.signIn(
        email: signInEmail.text,
        password: signInPassword.text
    );
   response.fold((errorState) => emit(SignInFailureState(errMessage: errorState)), (signInModel) => emit(SignInSuccessState(message: 'Login Successfully')));
  }
}
