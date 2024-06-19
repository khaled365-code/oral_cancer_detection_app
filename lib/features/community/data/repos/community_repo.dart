

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/features/community/data/models/get_comments_model/Message.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/NewAllPostsModel.dart';
import 'package:graduation_project/features/community/data/models/search_model/SearchPostModel.dart';


abstract class CommunityRepo
{

  Future<Either<String,String>>uploadPost({ String? body, MultipartFile? image,required int userId,required String token});
  Future<Either<String,NewAllPostsModel>>getAllPosts({required String token});

  Future<Either<String,String>>addLikeForPost({required num postId,required num userId,required String token});

  Future<Either<String,String>>addComment({required num postId,required String userId,required String comment,required String token});


  Future<SearchPostModel>searchForPosts({required String token,required String searchContent});

  Future<Either<String,Message>> getAllComments({required num postId,required String userId,required String token});

}