

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/home/data/models/medical_record_models/medical_record_model.dart';
import 'package:graduation_project/features/home/data/models/medical_record_models/save_medical_record_model.dart';
import 'package:graduation_project/features/home/data/models/top_headlines_news_medical_model/TopHeadlinesMedicalModel.dart';
import 'package:graduation_project/features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo { 
  
  ApiConsumer apiConsumer;
  HomeRepoImplementation({required this.apiConsumer});
  @override
  Future<Either<String, TopHeadlinesMedicalModel>> findTopMedicalNews({required  apiKey, required  country, required  category,required totalResults}) async
  {
   
    try
    {
      final response= await apiConsumer.get(EndPoints.findTopMedicalHeadLines(apiKey: apiKey, country: country, category: category,totalResults: totalResults));

      TopHeadlinesMedicalModel topHeadlinesMedicalModel=TopHeadlinesMedicalModel.fromJson(response);
      return Right(topHeadlinesMedicalModel);
    }on ServerException catch (e)
    {
      return Left(e.errorModel.errorMessage);
    }
    
    
  }

  @override
  Future<Either<String, SaveMedicalRecordModel>> saveMedicalRecords({required String token, required String id, required String diagnosis, required String diagnosisDate}) async{

   try{
     final response=await apiConsumer.post(
         EndPoints.medicalRecordBaseUrl,
         queryParams: {
           ApiKeys.user_id:id,
           ApiKeys.token:token,
           ApiKeys.diagnosis:diagnosis,
           ApiKeys.diagnosis_date:diagnosisDate

         }
     );
    final responseModel=SaveMedicalRecordModel.fromJson(response);
    return right(responseModel);
   }
   on ServerException catch(e){
     return left(e.errorModel.errorMessage);

   }
  }



}
