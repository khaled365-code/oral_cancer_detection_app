

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/community/data/models/Data.dart';
import 'package:graduation_project/features/community/data/models/TemporaryPostDetailsModel.dart';
import 'package:graduation_project/features/community/data/models/one_post_model/OnePostModel.dart';
import 'package:image_picker/image_picker.dart';

import '../models/post_uploaded_successfully_model.dart';
import 'community_repo.dart';

class CommunityRepoImplementation implements CommunityRepo {

  final ApiConsumer api;

  CommunityRepoImplementation({required this.api});

  @override
  Future<Either<String, String>> uploadPost({required String title, required String body,XFile? image, required int userId, required String token}) async {
    try
    {
      final response = await api.post(EndPoints.storeNewPost, data:
      {
        ApiKeys.title: title,
        ApiKeys.body: body,
        ApiKeys.user_id: userId,
        ApiKeys.token: token,

      },
          isFormData: true
      );
      final postSuccesUpladedInstance = PostUploadedSuccessFully.fromJson(response);
      return Right(postSuccesUpladedInstance.message);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
  @override
  Future<Either<String, TemporaryPostDetailsModel>> getAllPosts({required String token}) async
  {
    try
    {
      final response=await api.get(EndPoints.getAllPosts(token),
        queryParams: {
          ApiKeys.token:token
        }
      );
      final postDetailsModel=TemporaryPostDetailsModel.fromJson(response);
      return Right(postDetailsModel);

    } on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }

  }

  @override
  Future<Either<String, String>> addLikeForPost({required num postId, required num userId, required String token}) async
  {
   try{

     final response= await api.post(EndPoints.addLikeForPostEndPoint(
       postId: postId,
       userId: userId,
       token: token,),

     );
     return Right(response[ApiKeys.message]);
   }on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }

  }

  @override
  Future<Either<String, String>> addComment({required num postId, required num userId, required String comment, required String token}) async
  {

    try
    {
      final response= await api.post(EndPoints.addCommentForPost(
          postId: postId,
          userId: userId,
          comment: comment,
          token: token));

      return Right(response[ApiKeys.message]);


    } on ServerException catch(e)
    {
       return Left(e.errorModel.errorMessage);
    }

  }

  @override
  Future<Either<String, OnePostModel>> getOnePostDetails({required String token, required num postId}) async
  {
    try
    {
      final response=api.get(EndPoints.getOnePostEndPoint(
          token: token,
          postId: postId));

      return Right(OnePostModel.fromJson(response));

    } on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }


  }
    
    
    
    

  
}
