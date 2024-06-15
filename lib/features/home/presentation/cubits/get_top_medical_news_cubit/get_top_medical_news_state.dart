part of 'get_top_medical_news_cubit.dart';

@immutable
abstract class GetTopMedicalNewsState {}

class GetTopMedicalNewsInitial extends GetTopMedicalNewsState {}

class GetTopMedicalNewsLoadingState extends GetTopMedicalNewsState {}


class GetTopMedicalNewsSuccessState extends GetTopMedicalNewsState {

  final TopHeadlinesMedicalModel topHeadlinesMedicalModel;

  GetTopMedicalNewsSuccessState({required this.topHeadlinesMedicalModel});

}



class GetTopMedicalNewsFailureState extends GetTopMedicalNewsState {

  final String errMessage;

  GetTopMedicalNewsFailureState({required this.errMessage});

}


class TopHeadlinesValueChanged extends GetTopMedicalNewsState {}


