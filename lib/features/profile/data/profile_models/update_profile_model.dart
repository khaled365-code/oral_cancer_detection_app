import 'package:graduation_project/core/api/api_endPoints.dart';

class UpdateProfileModel{
  final String message;
  UpdateProfileModel({required this.message});

  factory UpdateProfileModel.fromJson(jsonData){
    return UpdateProfileModel(message: jsonData[ApiKeys.message]);
  }
}