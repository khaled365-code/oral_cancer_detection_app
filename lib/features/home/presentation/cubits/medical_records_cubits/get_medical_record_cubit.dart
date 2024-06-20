import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/api_endPoints.dart';
import '../../../../../core/errors/handle_error.dart';
import '../../../data/models/medical_record_models/medical_record_model.dart';
import '../../../data/repos/home_repo_implementation.dart';

part 'medical_record_state.dart';

class MedicalRecordCubit extends Cubit<MedicalRecordState> {
  MedicalRecordCubit({required this.apiConsumer,}) : super(MedicalRecordInitial());

  ApiConsumer apiConsumer;

  List<MedicalRecordModel> medicalRecordList=[];
  // String diagnosisResult='';

  Future<Either<String, List<MedicalRecordModel>>> getMedicalRecords()async {
    try{
      emit(MedicalRecordLoading());
      final response=await apiConsumer.get(
          EndPoints.medicalRecordBaseUrl
          ,queryParams: {
        ApiKeys.user_id:CacheHelper().getData(key: ApiKeys.id),
        ApiKeys.token:CacheHelper().getData(key: ApiKeys.token)
      });
      List<dynamic> medicalRecords=response[ApiKeys.medicalRecords];
      for(var record in medicalRecords){
        MedicalRecordModel medicalRecordModel=MedicalRecordModel(
            diagnosis: record[ApiKeys.diagnosis],
            diagnosisDate: record[ApiKeys.diagnosis_date]);
        medicalRecordList.add(medicalRecordModel);
        // diagnosisResult=record[ApiKeys.diagnosis];

      }
      emit(MedicalRecordSuccess());
      return right(medicalRecordList);

    }
    on ServerException catch(e){
      emit(MedicalRecordFailure(errMessage: e.errorModel.errorMessage));
      return left(e.errorModel.errorMessage);
    }
  }




}
