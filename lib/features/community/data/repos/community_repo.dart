

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../models/post_details_mode;.dart';

abstract class CommunityRepo
{

  Future<Either<String,String>>uploadPost({required String title,required String body,XFile? image,required int id,required String token});
  Future<Either<String,PostDetailsModel>>getAllPosts({required String token});

}