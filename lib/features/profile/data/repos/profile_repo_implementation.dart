
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/profile/data/models/get_profile_data_model/profile_data_model.dart';
import 'package:graduation_project/features/profile/data/models/update_profile_model/update_profile_model.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo.dart';
import 'package:image_picker/image_picker.dart';



class ProfileRepoImplementation implements ProfileRepo {

  final ApiConsumer api;
  ProfileRepoImplementation({required this.api});



   //   Future<Either<String,UpdateProfileModel>>updateProfile(
//       {
//   required dynamic profilePic,
//    String? updatedName,
//    String? updatedEmail})async{
//     try{
//       final response=await api.post(EndPoints.updateProfile,
//           queryParams: {
//             ApiKeys.userId:CacheHelper().getData(key: ApiKeys.id)
//           },
//           data: {
//             ApiKeys.photo:uploadImageToAPI(profilePic),
//             ApiKeys.name:updatedName,
//             ApiKeys.email:updatedEmail,
//             ApiKeys.token:CacheHelper().getData(key: ApiKeys.token)
//           },
//           isFormData: true
//
//       );
//       return right(UpdateProfileModel.fromJson(response));
//     }
//     on ServerException catch(e){
//       return left(e.errorModel.errorMessage);
//     }
// }

  @override
  Future<Either<String, GetProfileDataModel>> getProfileData({required String userId,required String token}) async
  {
    try
    {
      final response=await api.get(
          EndPoints.getUserProfile(
              userId: userId,
              token: token));

          GetProfileDataModel profileDataModel=GetProfileDataModel.fromJson(response);
          return Right(profileDataModel);

    }
    on ServerException catch (e)
    {
      return(left(e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<String, UpdateProfileModel>> updateMyProfile({required String userId, required String token, String? name, String? email, MultipartFile? updatedPhoto}) async {
   try
   {
     final Map<String, dynamic> data = {};

     if (updatedPhoto != null) {
       data[ApiKeys.photo] = updatedPhoto;
     }
     if (name != null) {
       data[ApiKeys.name] = name;
     }
     if (email != null) {
       data[ApiKeys.email] = email;
     }
     data[ApiKeys.token] = token;

     final response = await api.post(
       EndPoints.updateProfileEndPoint(userId: userId),
       data: data,
       isFormData: true,
     );
     UpdateProfileModel updateProfileModel=UpdateProfileModel.fromJson(response);

     return Right(updateProfileModel);
     
     
   }on ServerException catch (e)
   {
     return Left(e.errorModel.errorMessage);
   }
    
  }

  @override
  Future<Either<String, String>> updatePassword({required String userId, required String token, required String oldPassword, required String newPassword, required String confirmNewPassword}) async
  {
    try
        {
          final response=await api.post(EndPoints.updatePasswordEndPoint,
            data: {
            ApiKeys.current_password:oldPassword,
              ApiKeys.password:newPassword,
              ApiKeys.password_confirmation:confirmNewPassword,
              ApiKeys.token:token,
              ApiKeys.user_id:userId
            }
          );

          return Right(response['message']);


        }on ServerException catch (e)
        {
          return Left(e.errorModel.errorMessage);
        }


  }

  @override
  Future<Either<String, String>> logout({required String token}) async
  {
    try
    {
      final response=await api.post(EndPoints.logoutEndPoint(token: token));
      
      return Right(response['message']);

    }on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }
  }

}