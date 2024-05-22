part of 'profile_cubit.dart';

@immutable
abstract class GetProfileDataCubitState {}

class ProfileInitial extends GetProfileDataCubitState {}


class GetProfileDataLoadingState extends GetProfileDataCubitState {}



class GetProfileDataSucccessState extends GetProfileDataCubitState {

  final GetProfileDataModel getProfileDataModel;

  GetProfileDataSucccessState({required this.getProfileDataModel});
}



class GetProfileDataFailureState extends GetProfileDataCubitState {

  final String errorMessage;
  GetProfileDataFailureState({required this.errorMessage});
}


