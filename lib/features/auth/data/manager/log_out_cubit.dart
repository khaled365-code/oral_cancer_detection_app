import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/auth/data/manager/log_out_state.dart';
import 'package:graduation_project/features/auth/data/repos/auth_repos.dart';

class LogOutCubit extends Cubit<LogOutState>{
  LogOutCubit({required this.authRepos}):super(LogOutInitial());
  final AuthRepos authRepos;

  final userToken=CacheHelper().getData(key: ApiKeys.token);

  LogOut() async{
    emit(LogOutLoading());
    final response=await authRepos.LogOut(token: userToken);
    response.fold(
            (errorMessage) => emit(LogOutFailure(errorMessage: errorMessage)),
            (logOut) =>emit(LogOutSuccess(message:logOut.message)));
  }

}