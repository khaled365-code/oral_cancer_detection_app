import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/features/profile/data/models/update_profile_model/update_profile_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/profile_repo_implementation.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({required this.profileRepo}) : super(UpdateProfileInitial());
   final ProfileRepoImplementation profileRepo;


   TextEditingController nameController=TextEditingController();
   TextEditingController phoneController=TextEditingController();
   TextEditingController emailController=TextEditingController();
   TextEditingController dateOfBirthController=TextEditingController();
  TextEditingController  genderController=TextEditingController();


  GlobalKey<FormState> updateProfileKey=GlobalKey<FormState>();





  XFile? updatedProfilePic;

  uploadProfilePic({required XFile uploadedProfilePic}){
    updatedProfilePic=uploadedProfilePic;
    emit(UpdateProfilePictureState());
  }

  updateProfileFun({XFile? updatedPhoto,String? name, String? email}) async
  {
     final response =await profileRepo.updateMyProfile(
        userId: CacheHelper().getData(key: ApiKeys.id),
        token: CacheHelper().getData(key: ApiKeys.token),
        name: name==null ? null:name,
        email: email==null?null:email,
        updatedPhoto: updatedPhoto!=null? await uploadImageToAPI(updatedPhoto):null);


    response.fold((error) => emit(UpdateProfileFailureState(errMessage: error)),
            (success) => emit(UpdateProfileSuccessState(updateProfileModel: success)));
  }


  // updateProfile() async
  // {
  //   emit(UpdateProfileLoadingSate());
  //   final response=await profileRepos.updateProfile(
  //       profilePic: updatedProfilePic?? AssetImage(ImageConstants.ProfileUserImage),
  //       updatedName: nameController.text  ,
  //       updatedEmail: emailController.text
  //   );
  //   response.fold((errorState) => emit(UpdateProfileFailureState(errMessage: errorState)),
  //           (updateProfileModel) => emit(UpdateProfileSuccessState(message: updateProfileModel.message)));
  // }


}
