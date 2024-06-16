

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/errors/handle_error.dart';
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
}
