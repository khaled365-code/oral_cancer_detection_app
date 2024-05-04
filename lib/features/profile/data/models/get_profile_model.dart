import 'package:graduation_project/core/api/api_endPoints.dart';

class getProfileModel {

 final String name;
 final String email;
 final String userImage;

  getProfileModel({required this.name, required this.email,required this.userImage});

  factory getProfileModel.fromJson(Map<String,dynamic> jsonData){

   return getProfileModel(
       name:jsonData[ApiKeys.name] ,
       email:jsonData[ApiKeys.email],
       userImage: jsonData['profile_photo_url'],
   );
  }
}