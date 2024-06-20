import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/diagnosis/presentation/cubits/questions_cubit/question_diagnosis_cubit.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/home_repo_implementation.dart';

part 'save_medical_record_state.dart';

class SaveMedicalRecordCubit extends Cubit<SaveMedicalRecordState> {
  SaveMedicalRecordCubit(this.homeRepoImplementation) : super(SaveMedicalRecordInitial());
  HomeRepoImplementation homeRepoImplementation;
  bool isPressed=false;



  saveMedicalRecord(BuildContext context)async{
    var questionCubit=BlocProvider.of<QuestionDiagnosisCubit>(context);

    final response=await homeRepoImplementation.saveMedicalRecords(
        token: CacheHelper().getData(key: ApiKeys.token),
        id: CacheHelper().getData(key: ApiKeys.id),
        diagnosis: questionCubit.ConvertToDiseaseName(context),
        diagnosisDate: formatDate());
    response.fold((errorState) => emit(SaveMedicalRecordFailure(errorState)),
            (successState) => emit(SaveMedicalRecordSuccess(successMessage: successState.message)));

  }

  String formatDate(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
   return formattedDate;
  }

  toggleSaveIcon(){
    isPressed=!isPressed;
    emit(SaveMedicalRecordIconChange());

  }

}
