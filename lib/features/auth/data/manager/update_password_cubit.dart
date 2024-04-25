import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../repos/auth_repos.dart';
part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit({ required this.authRepos}) : super(UpdatePasswordInitial());

   final AuthRepos authRepos;
  TextEditingController currentPassword=TextEditingController();
  TextEditingController newPassword=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();


  updatePassword()async{
    emit(UpdatePasswordLoadingState());
    final response=await authRepos.updatePassword(
        currentPass: currentPassword.text,
        newPass: newPassword.text,
        confirmPass: confirmPassword.text
    );
    response.fold((errorState) => emit(UpdatePasswordFailureState(errorState)), (updatePassModel) => emit(UpdatePasswordSuccessState(updatePassModel.mesaage)));


  }



}
