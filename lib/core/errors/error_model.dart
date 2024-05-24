import '../api/api_endPoints.dart';

class ErrorModel{
  final String errorMessage;
  final int status;
  final String error;


  ErrorModel({required this.errorMessage ,required this.status, required this.error});
  factory ErrorModel.fromJson(Map<String,dynamic> jsonData){
    return ErrorModel(
      errorMessage: jsonData[ApiKeys.message]??"",
      status: jsonData[ApiKeys.status] as int? ?? 0,
      error: jsonData[ApiKeys.error]??""
    );

  }

}