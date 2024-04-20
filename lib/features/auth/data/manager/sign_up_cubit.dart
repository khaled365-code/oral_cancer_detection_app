import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/data/manager/sign_up_state.dart';
import 'package:graduation_project/features/auth/data/repos/auth_repos.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit({required this.authRepos}):super(SignUpInitial());
  final AuthRepos authRepos;

   TextEditingController signUpName= TextEditingController();
   TextEditingController signUpEmail= TextEditingController();
   TextEditingController signUpPassword= TextEditingController();
   TextEditingController signUpConfPassword= TextEditingController();

   Register() async{
      emit(SignUploading());
      final response= await authRepos.Register(
          name: signUpName.text,
          email: signUpEmail.text,
          password: signUpPassword.text,
          confPassword:signUpConfPassword.text
      );
    response.fold(
            (errorMessage) =>SignUpFailure(errorMessage: errorMessage),
            (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)));
 }

}