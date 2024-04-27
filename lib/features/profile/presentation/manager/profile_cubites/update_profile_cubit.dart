import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../data/profile_models/get_profile_model.dart';
import '../../../data/repos/profile_repos.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({required this.profileRepos}) : super(UpdateProfileInitial());
   final ProfileRepos profileRepos;
   getProfileModel? userProfile;

  TextEditingController? updatedName;
  TextEditingController? updatedEmail;

  void initializeTextFields() {
    if (userProfile != null) {
      updatedName = TextEditingController(text: userProfile!.name);
      updatedEmail = TextEditingController(text: userProfile!.email);
    } else {
      updatedName = TextEditingController();
      updatedEmail = TextEditingController();
    }
    // emit(UpdateProfileInitial());
  }
  XFile? updatedProfilePic;

  uploadProfilePic({required XFile uploadedProfilePic}){
    updatedProfilePic=uploadedProfilePic;
    emit(UpdateProfilePictureState());
  }


  updateProfile()async{
    emit(UpdateProfileLoadingSate());
    final response=await profileRepos.updateProfile(
        profilePic: updatedProfilePic?? AssetImage(ImageConstants.account),
        updatedName: updatedName?.text  ,
        updatedEmail: updatedEmail?.text
    );
    response.fold((errorState) => emit(UpdateProfileFailureState(errMessage: errorState)),
            (updateProfileModel) => emit(UpdateProfileSuccessState(message: updateProfileModel.message)));
  }
}
