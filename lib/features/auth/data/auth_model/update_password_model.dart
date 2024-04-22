import 'package:graduation_project/core/api/api_endPoints.dart';

class UpdatePasswordModel{
  final String mesaage;

  UpdatePasswordModel({ required this.mesaage});

  factory UpdatePasswordModel.fromJson(jsonData){
    return UpdatePasswordModel(mesaage: jsonData[ApiKeys.message]);
  }

}