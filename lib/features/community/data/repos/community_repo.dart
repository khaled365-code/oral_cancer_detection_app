

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/features/community/data/models/TemporaryPostDetailsModel.dart';
import 'package:graduation_project/features/community/data/models/one_post_model/OnePostModel.dart';
import 'package:graduation_project/features/community/data/models/search_model/SearchPostModel.dart';


abstract class CommunityRepo
{

  Future<Either<String,String>>uploadPost({required String title,required String body,MultipartFile? image,required int userId,required String token});
  Future<Either<String,TemporaryPostDetailsModel>>getAllPosts({required String token});

  Future<Either<String,String>>addLikeForPost({required num postId,required num userId,required String token});

  Future<Either<String,String>>addComment({required num postId,required num userId,required String comment,required String token});

  Future<Either<String,OnePostModel>> getOnePostDetails({required String token,required num postId});

  Future<Either<String,SearchPostModel>>searchForPosts({required String token,required String searchContent});

}