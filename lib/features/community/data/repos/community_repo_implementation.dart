

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:image_picker/image_picker.dart';

import '../models/post_uploaded_successfully_model.dart';
import 'community_repo.dart';

class CommunityRepoImplementation implements CommunityRepo {

  final ApiConsumer api;

  CommunityRepoImplementation({required this.api});

  @override
  Future<Either<String, String>> uploadPost({required String title, required String body, XFile? image, required int id, required String token}) async {
    try {
      final response = await api.post(EndPoints.storeNewPost, data:
      {
        ApiKeys.title: title,
        ApiKeys.body: bool,
        ApiKeys.user_id: id,
        ApiKeys.token: token,

      },
          isFormData: true
      );
      final postSuccesUpladedInstance = PostUploadedSuccessFully.fromJson(
          response.data);
      return Right(postSuccesUpladedInstance.message);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
    
    
    
    

  
}
