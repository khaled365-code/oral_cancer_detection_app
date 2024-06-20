

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
import 'package:graduation_project/features/home/data/models/medical_record_models/medical_record_model.dart';
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

  // @override
  // Future<Either<String, List<MedicalRecordModel>>> getMedicalRecords({ required String id,required String token})async {
  //   try{
  //     final response=await apiConsumer.get(
  //         EndPoints.medicalRecordBaseUrl
  //         ,queryParams: {
  //       ApiKeys.user_id:id,
  //       ApiKeys.token:token
  //
  //     });
  //     List<MedicalRecordModel> medicalRecordList=[];
  //     List<dynamic> medicalRecords=response[ApiKeys.medicalRecords];
  //
  //     for(var record in medicalRecords){
  //       MedicalRecordModel medicalRecordModel=MedicalRecordModel(
  //           diagnosis: record[ApiKeys.diagnosis],
  //           diagnosisDate: record[ApiKeys.diagnosis_date]);
  //       medicalRecordList.add(medicalRecordModel);
  //     }
  //     return right(medicalRecordList);
  //   }
  //   on ServerException catch(e){
  //     return left(e.errorModel.errorMessage);
  //   }
  //
  // }


}
