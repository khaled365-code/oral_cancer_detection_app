import '../../../../core/api/api_endPoints.dart';

class QuestionDiagnosisModel{
  final List<dynamic> prediction;

  QuestionDiagnosisModel({required this.prediction});

  factory QuestionDiagnosisModel.fromJson(jsonData){
    return QuestionDiagnosisModel(prediction: jsonData[ApiKeys.predictions]);
  }
}