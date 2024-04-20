import 'package:graduation_project/core/api/api_endPoints.dart';

class SignInModel{
  final String token;

  SignInModel({required this.token});
  
  factory SignInModel.fromJson(jsonData){
    return SignInModel(token: jsonData[ApiKeys.token]);
  }
}