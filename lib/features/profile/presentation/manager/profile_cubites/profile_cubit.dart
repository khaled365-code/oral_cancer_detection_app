import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/profile/data/profile_models/get_profile_model.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repos.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  final ProfileRepos profileRepo;

  GetUserProfile() async{
    emit(ProfileLoading());
    final response=await profileRepo.GetUserProfile();
    response.fold(
            (errorMessage) => emit(ProfileFailure(errorMessage: errorMessage)),
            (userProfile) => emit(ProfileSuccess(userProfile: userProfile))
    );

  }

}
