import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/profile/data/profile_models/get_profile_model.dart';

class ProfileRepos {

  final ApiConsumer api;
  ProfileRepos({required this.api});

  Future<Either<String,getProfileModel>> GetUserProfile({required String userToken}) async{
    try {
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

}