import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import '../models/questionsqiagnosis_model.dart';

class AiRepository{
  AiRepository({required this.api});
  final ApiConsumer api;


  Future<QuestionDiagnosisModel>questionDiagnose({
    required int localization,
    required int tobacoUse
    ,required int alcholConsumption,
    required int sunExposure,
    required int gender,
    required int ageGroup,
    required int ulcersLastsMoreThan3Weeks,
    required int ulcersSpreading })async{


     final response=await api.post(EndPoints.predict,
         isFormData: true,
         data: {
           ApiKeys.localization:localization,
           ApiKeys.tobacco_use:tobacoUse,
           ApiKeys.alcohol_consumption:alcholConsumption,
           ApiKeys.sun_exposure:sunExposure,
           ApiKeys.gender:gender,
           ApiKeys.age_group:ageGroup,
           ApiKeys.ulcers_lasts_more_than_3_weeks:ulcersLastsMoreThan3Weeks,
           ApiKeys.ulcers_spreading:ulcersSpreading
         }
     );
     return QuestionDiagnosisModel.fromJson(response);

}

}