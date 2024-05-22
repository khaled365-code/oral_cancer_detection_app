


import 'package:graduation_project/core/api/api_endPoints.dart';

class PostUploadedSuccessFully
{
  final String message;
  final int status;

   PostUploadedSuccessFully({required this.message,required this.status});

  factory PostUploadedSuccessFully.fromJson(json)
  {
     return PostUploadedSuccessFully(
      message: json[ApiKeys.message],
       status: json[ApiKeys.status]
     );
  }

}