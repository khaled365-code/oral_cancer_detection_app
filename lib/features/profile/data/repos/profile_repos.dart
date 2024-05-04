
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/profile/data/models/update_profile_model.dart';

import '../models/get_profile_model.dart';


class ProfileRepos {

  final ApiConsumer api;
  ProfileRepos({required this.api});

  Future<Either<String,getProfileModel>> GetUserProfile() async{
    try {
      final userToken=CacheHelper().getData(key: ApiKeys.token);
      final response=await api.get(
          EndPoints.UserProfile,
          queryParams: {
           ApiKeys.token:userToken,
            }
      );
      print(userToken);
      final getUser=getProfileModel.fromJson(response);
      return(right(getUser));
    }
    on ServerException catch (e) {
      return(left(e.errorModel.errorMessage));
    }
}

Future<Either<String,UpdateProfileModel>>updateProfile({
  required dynamic profilePic,
   String? updatedName,
   String? updatedEmail})async{
    try{
      final response=await api.post(EndPoints.updateProfile,
          queryParams: {
            ApiKeys.userId:CacheHelper().getData(key: ApiKeys.id)
          },
          data: {
            ApiKeys.photo:profilePic,
            ApiKeys.name:updatedName,
            ApiKeys.email:updatedEmail,
            ApiKeys.token:CacheHelper().getData(key: ApiKeys.token)
          },
          isFormData: true

      );
      return right(UpdateProfileModel.fromJson(response));
    }
    on ServerException catch(e){
      return left(e.errorModel.errorMessage);
    }
}

}