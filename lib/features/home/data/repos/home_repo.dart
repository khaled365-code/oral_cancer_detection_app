

import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/home/data/models/medical_record_models/medical_record_model.dart';
import 'package:graduation_project/features/home/data/models/top_headlines_news_medical_model/TopHeadlinesMedicalModel.dart';

import '../models/medical_record_models/save_medical_record_model.dart';

abstract class HomeRepo
{

  Future<Either<String,TopHeadlinesMedicalModel>>findTopMedicalNews({required  apiKey,required  country,required  category,required totalResults});
  Future<Either<String,SaveMedicalRecordModel>>saveMedicalRecords({required String token ,required  String id ,required  String diagnosis,required  String diagnosisDate});
  //Future<Either<String,List<MedicalRecordModel>>>getMedicalRecords({required String token ,required  String id  });

}