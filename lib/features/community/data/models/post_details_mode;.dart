

import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:image_picker/image_picker.dart';

class PostDetailsModel
{
  final XFile image;
  final String body;
  final DateTime createdAt;
  final int user_id;

  PostDetailsModel({required this.image, required this.body, required this.createdAt, required this.user_id});


  factory  PostDetailsModel.fromJson(json)
  {
    return PostDetailsModel(
      image: json[ApiKeys.image] ,
      body: json[ApiKeys.body],
      createdAt: json[ApiKeys.created_at],
      user_id: json[ApiKeys.user_id] ,
    );


  }


}