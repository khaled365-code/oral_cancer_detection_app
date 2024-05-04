part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileLoadingSate extends UpdateProfileState {}
class UpdateProfileSuccessState extends UpdateProfileState {
  UpdateProfileSuccessState({required this.message});
  final String message;
}
class UpdateProfileFailureState extends UpdateProfileState {
  UpdateProfileFailureState({required this.errMessage});
  final String errMessage;
}
class UpdateProfilePictureState extends UpdateProfileState {
}

