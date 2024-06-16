import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/data/models/top_headlines_news_medical_model/TopHeadlinesMedicalModel.dart';
import 'package:graduation_project/features/home/data/repos/home_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'get_top_medical_news_state.dart';

class GetTopMedicalNewsCubit extends Cubit<GetTopMedicalNewsState> {
  GetTopMedicalNewsCubit({required this.homeRepoImplementation}) : super(GetTopMedicalNewsInitial());

  HomeRepoImplementation homeRepoImplementation;


  getTopMedicalNews()async
  {
    emit(GetTopMedicalNewsLoadingState());
    final response=await homeRepoImplementation.findTopMedicalNews(apiKey: '3da713be28064f708b181db3297152a8', country: 'us', category: 'health',totalResults: 100);
    response.fold((error) => emit(GetTopMedicalNewsFailureState(errMessage: error)),
            (success)
            {
              emit(GetTopMedicalNewsSuccessState(topHeadlinesMedicalModel: success));
            });
  }


}
