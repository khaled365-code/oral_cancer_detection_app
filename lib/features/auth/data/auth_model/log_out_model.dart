import 'package:graduation_project/core/api/api_keys.dart';

class LogOutModel{

  final String message;

  LogOutModel({required this.message});

  factory LogOutModel.fromJson(Map<String,dynamic> jsonData){
    return LogOutModel(message: jsonData[ApiKeys.message]);
  }

}