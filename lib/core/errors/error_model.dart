import '../api/api_endPoints.dart';

class ErrorModel{
  final String errorMessage;
  final int status;


  ErrorModel({required this.errorMessage ,required this.status});
  factory ErrorModel.fromJson(Map<String,dynamic> jsonData){
    return ErrorModel(
      errorMessage: jsonData[ApiKeys.message],
      status: jsonData[ApiKeys.status] as int? ?? 0
    );

  }

}