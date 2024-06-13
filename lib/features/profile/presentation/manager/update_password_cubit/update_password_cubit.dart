import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'update_password_state.dart';

class UpdatePasswordFromSettingsCubit extends Cubit<UpdatePasswordFromSettingsState> {
  UpdatePasswordFromSettingsCubit({required this.profileRepoImplementation}) : super(UpdatePasswordInitial());

  ProfileRepoImplementation profileRepoImplementation;


  TextEditingController oldPasswordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController confirmNewPasswordController=TextEditingController();


  IconData oldPasswordIcon=Icons.visibility_off;
  IconData newPasswordIcon=Icons.visibility_off;
  IconData confirmNewPasswordIcon=Icons.visibility_off;

  bool oldPasswordObscure=true;
  bool newPasswordObscure=true;
  bool confirmNewPasswordObscure=true;

  updateOldPasswordIcon()
  {
    if(oldPasswordIcon==Icons.visibility)
      {
        oldPasswordIcon=Icons.visibility_off;
        oldPasswordObscure=true;

      }
    else
      {
        oldPasswordIcon=Icons.visibility;
        oldPasswordObscure=false;

      }
    emit(UpdatePasswordOldPasswordIconState());
  }

  updateNewPasswordIcon()
  {
    if(newPasswordIcon==Icons.visibility)
    {
      newPasswordIcon=Icons.visibility_off;
      newPasswordObscure=true;
    }
    else
    {
      newPasswordIcon=Icons.visibility;
      newPasswordObscure=false;

    }
    emit(UpdatePasswordNewPasswordIconState());
  }

  updateConfirmNewPasswordIcon()
  {
    if(confirmNewPasswordIcon==Icons.visibility)
    {
      confirmNewPasswordIcon=Icons.visibility_off;
      confirmNewPasswordObscure=true;

    }
    else
    {
      confirmNewPasswordIcon=Icons.visibility;
      confirmNewPasswordObscure=false;

    }
    emit(UpdatePasswordConfirmNewPasswordIconState());
  }

  GlobalKey<FormState> updatePasswordKey=GlobalKey<FormState>();

  updatePassword({required String oldPassword,required String newPassword,required String confirmNewPassword}) async
  {
    emit(UpdatePasswordLoadingState());

    final response= await profileRepoImplementation.updatePassword(
        userId: CacheHelper().getData(key: ApiKeys.id),
        token: CacheHelper().getData(key: ApiKeys.token),
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword);

    response.fold((error) => emit(UpdatePasswordFailureState(errorMessage: error)),
            (success) => emit(UpdatePasswordSuccessState(successMessage: success)));


  }


}
