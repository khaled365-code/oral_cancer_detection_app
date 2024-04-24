import 'package:graduation_project/core/api/api_endPoints.dart';

class getProfileModel {

 final String name;
 final String email;

  getProfileModel({required this.name, required this.email});

  factory getProfileModel.fromJson(Map<String,dynamic> jsonData){

   return getProfileModel(
       name:jsonData[ApiKeys.name] ,
       email:jsonData[ApiKeys.email]);
  }
}