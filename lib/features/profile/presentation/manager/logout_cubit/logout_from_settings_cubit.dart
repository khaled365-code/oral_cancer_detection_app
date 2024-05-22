import 'package:bloc/bloc.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'logout_from_settings_state.dart';

class LogoutFromSettingsCubit extends Cubit<LogoutFromSettingsState> {
  LogoutFromSettingsCubit({required this.profileRepoImplementation}) : super(LogoutFromSettingsInitial());

  ProfileRepoImplementation profileRepoImplementation;
  logout() async
  {
    emit(LogoutFromSettingsLoadingState());

   final response= await profileRepoImplementation.logout(
       token: CacheHelper().getData(key: ApiKeys.token));

   response.fold((error) => emit(LogoutFromSettingsFailureState(errorMessage: error)),
           (success) => emit(LogoutFromSettingsSuccessState(successMessage: success)));
  }
}
