

 import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/features/profile/data/models/get_profile_data_model/profile_data_model.dart';
import 'package:graduation_project/features/profile/data/models/update_profile_model/update_profile_model.dart';

 abstract class ProfileRepo
{

  Future<Either<String,GetProfileDataModel>>getProfileData({required String userId,required String token});

  Future<Either<String,UpdateProfileModel>>updateMyProfile(
      {required String userId,required String token,String? name,String? email,MultipartFile? updatedPhoto});





}