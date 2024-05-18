

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/community/data/models/TemporaryPostDetailsModel.dart';
import 'package:graduation_project/features/community/data/models/get_comments_model/Comments.dart';
import 'package:graduation_project/features/community/data/models/get_comments_model/GetCommentsModel.dart';
import 'package:graduation_project/features/community/data/models/get_comments_model/Message.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/Data.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/NewAllPostsModel.dart';
import 'package:graduation_project/features/community/data/models/one_post_model/OnePostModel.dart';
import 'package:graduation_project/features/community/data/models/search_model/SearchPostModel.dart';

import '../models/post_uploaded_successfully_model.dart';
import 'community_repo.dart';

class CommunityRepoImplementation implements CommunityRepo {

  final ApiConsumer api;

  CommunityRepoImplementation({required this.api});

  @override
  Future<Either<String, String>> uploadPost({required String title, required String body,MultipartFile? image, required int userId, required String token}) async {
    try
    {
      late var response;
      if(image!=null)
        {
           response = await api.post(EndPoints.storeNewPost, data:
          {
            ApiKeys.title: title,
            ApiKeys.body: body,
            ApiKeys.user_id: userId,
            ApiKeys.token: token,
            ApiKeys.image:image

          },
              isFormData: true
          );
        }
      else
        {
           response = await api.post(EndPoints.storeNewPost, data:
          {
            ApiKeys.title: title,
            ApiKeys.body: body,
            ApiKeys.user_id: userId,
            ApiKeys.token: token,
          },
              isFormData: true
          );
        }

      final postSuccesUpladedInstance = PostUploadedSuccessFully.fromJson(response);
      return Right(postSuccesUpladedInstance.message);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
  @override
  Future<Either<String, NewAllPostsModel>> getAllPosts({required String token}) async
  {
    try
    {
      final response=await api.get(EndPoints.getAllPosts(token));
      final NewAllPostsModel postDetailsModel=NewAllPostsModel.fromJson(response);
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
  Future<Either<String, String>> addComment({required num postId, required String userId, required String comment, required String token}) async
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
  Future<Either<String,SearchPostModel>> searchForPosts({required String token, required String searchContent}) async {
    try {

      final response=await api.post(EndPoints.searchForPostsEndpoint(
          token: token,
          searchContent: searchContent));

      final SearchPostModel searchModel=SearchPostModel.fromJson(response);
      return Right(searchModel);

    } on ServerException catch (e) {

       return Left(e.errorModel.errorMessage);
    }


  }

  @override
  Future<Either<String, Message>> getAllComments({required num postId, required String userId, required String token}) async
  {
     try
     {
       final response=await api.get(
           EndPoints.getAllComments(
               postId: postId,
               userId: userId,
               token: token));
       final Message commentMessages=Message.fromJson(response['message']);
       return Right(commentMessages);
     }on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }
  }
    
    
    
    

  
}
