import 'package:graduation_project/core/api/api_keys.dart';

class SaveMedicalRecordModel{
  final String message;
  SaveMedicalRecordModel({required this.message});
  factory SaveMedicalRecordModel.fromJson(jsonData){
    return SaveMedicalRecordModel(message: jsonData[ApiKeys.message]);
  }

}