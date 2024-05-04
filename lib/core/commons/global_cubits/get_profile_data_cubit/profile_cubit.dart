import 'package:bloc/bloc.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/profile/data/models/get_profile_model.dart';
import 'package:graduation_project/features/profile/data/models/profile_data_model.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repos.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utilis/image_constants.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  final List<ProfileDataModel>profileDataList=
  [
    ProfileDataModel(profileTitle: 'Your Profile', image: ImageConstants.userIcon,isSvg: true,),
    ProfileDataModel(profileTitle: 'Language', image: ImageConstants.language,),
    ProfileDataModel(profileTitle: 'Settings', image: ImageConstants.settings,),
    ProfileDataModel(profileTitle: 'Share App', image: ImageConstants.shareAppIcon,isSvg: true,),
    ProfileDataModel(profileTitle: 'Notifications', image: ImageConstants.notificationsIcon,isSvg: true,),
    ProfileDataModel(profileTitle: 'Contact us', image: ImageConstants.contactUsIcon,isSvg: true,),
    ProfileDataModel(profileTitle: 'Terms And Conditions', image: ImageConstants.termsAndConditionsIcon,isSvg: true,),
    ProfileDataModel(profileTitle: 'Help', image: ImageConstants.helpIcon,isSvg: true),
    ProfileDataModel(profileTitle: 'About APP', image: ImageConstants.questionsIcon,isSvg: true),
    ProfileDataModel(profileTitle: 'Log out', image: ImageConstants.logout),


  ];


  final ProfileRepos profileRepo;
  final userToken=CacheHelper().getData(key: ApiKeys.token);

  GetUserProfile() async{
    emit(ProfileLoading());
    final response=await profileRepo.GetUserProfile();
    response.fold(
            (errorMessage) => emit(ProfileFailure(errorMessage: errorMessage)),
            (userProfile) => emit(ProfileSuccess(userProfile: userProfile))
    );

  }

}
