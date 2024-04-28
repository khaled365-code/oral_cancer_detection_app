

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class CommunityRepo
{

  Future<Either<String,String>>uploadPost({required String title,required String body,XFile? image,required int id,required String token});

}