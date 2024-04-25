part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileSuccess extends ProfileState {
  final getProfileModel userProfile;

  ProfileSuccess({required this.userProfile});

}
class ProfileFailure extends ProfileState {
  final String errorMessage;

  ProfileFailure({required this.errorMessage});

}
