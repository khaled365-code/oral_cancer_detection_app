import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/profile/data/models/get_profile_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/profile_repos.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({required this.profileRepos}) : super(UpdateProfileInitial());
   final ProfileRepos profileRepos;

   getProfileModel? userProfile;

   TextEditingController nameController=TextEditingController();
   TextEditingController phoneController=TextEditingController();
   TextEditingController emailController=TextEditingController();
   TextEditingController dateOfBirthController=TextEditingController();
  TextEditingController genderController=TextEditingController();


  GlobalKey<FormState> updateProfileKey=GlobalKey<FormState>();





  XFile? updatedProfilePic;

  uploadProfilePic({required XFile uploadedProfilePic}){
    updatedProfilePic=uploadedProfilePic;
    emit(UpdateProfilePictureState());
  }


  updateProfile() async
  {
    emit(UpdateProfileLoadingSate());
    final response=await profileRepos.updateProfile(
        profilePic: updatedProfilePic?? AssetImage(ImageConstants.ProfileUserImage),
        updatedName: nameController.text  ,
        updatedEmail: emailController.text
    );
    response.fold((errorState) => emit(UpdateProfileFailureState(errMessage: errorState)),
            (updateProfileModel) => emit(UpdateProfileSuccessState(message: updateProfileModel.message)));
  }
}
