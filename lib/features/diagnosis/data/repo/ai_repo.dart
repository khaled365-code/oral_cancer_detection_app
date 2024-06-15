


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/diagnosis/data/models/image_diagnosis_model.dart';
import 'package:image_picker/image_picker.dart';
import '../models/questionsqiagnosis_model.dart';

class AiRepository {
  AiRepository({required this.api});
  final ApiConsumer api;

  Future<QuestionDiagnosisModel> questionDiagnose(
      {required int localization,
      required int tobacoUse,
      required int alcholConsumption,
      required int sunExposure,
      required int gender,
      required int ageGroup,
      required int ulcersLastsMoreThan3Weeks,
      required int ulcersSpreading}) async {
    final response = await api.post(EndPoints.predict, isFormData: true, data: {
      ApiKeys.localization: localization,
      ApiKeys.tobacco_use: tobacoUse,
      ApiKeys.alcohol_consumption: alcholConsumption,
      ApiKeys.sun_exposure: sunExposure,
      ApiKeys.gender: gender,
      ApiKeys.age_group: ageGroup,
      ApiKeys.ulcers_lasts_more_than_3_weeks: ulcersLastsMoreThan3Weeks,
      ApiKeys.ulcers_spreading: ulcersSpreading
    });

    return QuestionDiagnosisModel.fromJson(response);
  }

  Future<Either<String, ImageDiagnosisModel>> imageDiagnosis(
      {required XFile image}) async {
   try{

     final response = await api.post(EndPoints.classify,
         data: {

           ApiKeys.file: await MultipartFile.fromFile(image.path, filename: image.path.split('/').last)
         },
         isFormData: true);
     CacheHelper().saveData(key: 'imageClassify', value: response[ApiKeys.className]);
     CacheHelper().saveData(key: 'probCancer', value: response[ApiKeys.probCancer]);
     print(response[ApiKeys.className]);
     print(response[ApiKeys.probCancer]);
     return right(ImageDiagnosisModel.fromJson(response));

   }
   on ServerException catch(e){
     return left(e.errorModel.error);
   }

  }
}
