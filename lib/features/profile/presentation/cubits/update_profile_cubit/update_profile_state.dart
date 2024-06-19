part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileLoadingSate extends UpdateProfileState {}
class UpdateProfileSuccessState extends UpdateProfileState
{

  final UpdateProfileModel updateProfileModel;
  UpdateProfileSuccessState({required this.updateProfileModel});

}
class UpdateProfileFailureState extends UpdateProfileState
{
  final String errMessage;

  UpdateProfileFailureState({required this.errMessage});
}
class UpdateProfilePictureState extends UpdateProfileState {}


