part of 'profile_cubit.dart';

@immutable
abstract class GetProfileDataCubitState {}

class ProfileInitial extends GetProfileDataCubitState {}
class ProfileLoading extends GetProfileDataCubitState {}
class ProfileSuccess extends GetProfileDataCubitState {
  final getProfileModel userProfile;

  ProfileSuccess({required this.userProfile});

}
class ProfileFailure extends GetProfileDataCubitState {
  final String errorMessage;

  ProfileFailure({required this.errorMessage});

}
