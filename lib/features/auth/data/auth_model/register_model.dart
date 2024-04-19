import 'package:graduation_project/core/api/api_endPoints.dart';

class RegisterModel{

final String message;

RegisterModel({required this.message});

factory RegisterModel.fromJson(Map<String,dynamic> jsonData){
  return RegisterModel(message: jsonData[ApiKeys.message]);
}



}