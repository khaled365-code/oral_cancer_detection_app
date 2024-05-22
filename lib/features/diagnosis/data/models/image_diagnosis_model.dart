import 'package:graduation_project/core/api/api_endPoints.dart';

class ImageDiagnosisModel{
  final String className;
  final double probCancer;
  final double probNoNCancer;
  ImageDiagnosisModel({required this.className,required this.probCancer,required this.probNoNCancer});


  factory ImageDiagnosisModel.fromJson(jsonData){
    return ImageDiagnosisModel(
        className: jsonData[ApiKeys.className],
        probCancer: jsonData[ApiKeys.probCancer],
        probNoNCancer: jsonData[ApiKeys.probNonCancer]
    );
  }

}