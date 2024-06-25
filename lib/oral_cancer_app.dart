import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:graduation_project/core/commons/global_cubits/change_theme_cubit/change_theme_cubit.dart';
import 'package:graduation_project/core/commons/global_cubits/get_profile_data_cubit/profile_cubit.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/auth/data/manager/update_password_cubit.dart';
import 'package:graduation_project/features/auth/data/repos/auth_repos.dart';
import 'package:graduation_project/features/community/cubits/change_post_heart_shape/change_post_heart_shape_cubit.dart';
import 'package:graduation_project/features/community/cubits/change_retweet_shape_cubit/change_retweet_shape_cubit.dart';
import 'package:graduation_project/features/community/data/repos/community_repo_implementation.dart';
import 'package:graduation_project/features/diagnosis/data/repo/ai_repo.dart';
import 'package:graduation_project/features/diagnosis/presentation/cubits/questions_cubit/question_diagnosis_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubits/image_diagnosis_cubit/upload_image_cubit.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';

import 'features/home/presentation/cubits/home_contrller_cubit/home_controller_cubit.dart';

class OralCancerApp extends StatelessWidget {
  OralCancerApp({ required this.seenOnBoard});
  final bool seenOnBoard;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
          builder: (context, state) {
            return MaterialApp(

             // builder: DevicePreview.appBuilder,
              theme:context.read<ChangeThemeCubit>().isDarkMode==true?ThemeData.dark():ThemeData.light(),
              locale:  Locale(BlocProvider.of<ChangeLanguageCubit>(context).languageCode),
              localizationsDelegates: const [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalization.supportedLocales,
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
              debugShowCheckedModeBanner: false,
              initialRoute:Routes.splash,
              onGenerateRoute: AppRoutes.onGenerateRoutes,
              //CacheHelper().getData(key: ApiKeys.token)==null||seenOnBoard?Routes.loginScreen:seenOnBoard==false?Routes.splash:Routes.home,
              //seenOnBoard?Routes.loginScreen:Routes.splash
            );
          },
        );
      },
    );
  }
  String initialRouteHandler(){
    if(CacheHelper().getData(key: ApiKeys.token)==null&&seenOnBoard==false){
     return Routes.splash;
    }
    else if(CacheHelper().getData(key: ApiKeys.token)==null&&seenOnBoard==true){
     return Routes.loginScreen;
    }
    else{
      return Routes.home;
    }


  }
}

class MyApp extends StatelessWidget {
  final bool seenOnBoard;

  const MyApp({super.key,required this.seenOnBoard});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuestionDiagnosisCubit>(create: (context) => QuestionDiagnosisCubit(aiRepository: AiRepository(api: DioConsumer(dio: Dio(), isTextModel:true, isImageModel: false,))) ),
        BlocProvider<ChangeLanguageCubit>(create: (context) => ChangeLanguageCubit()),
        BlocProvider<GetProfileDataCubit>(create: (context) => GetProfileDataCubit(profileRepoImplementation: ProfileRepoImplementation(api: DioConsumer(dio: Dio(), isTextModel: false, isImageModel: false)))),
        BlocProvider<GlobalCommunityBloc>(create: (context) => GlobalCommunityBloc(communityRepoImplementation: CommunityRepoImplementation(api: DioConsumer(dio: Dio(),isTextModel:false, isImageModel: false)))..getAllPostsFun()),
        BlocProvider<UploadImageCubit>(create: (context) => UploadImageCubit()),
        BlocProvider<ChangeThemeCubit>(create: (context) => ChangeThemeCubit()),
        BlocProvider<ChangeRetweetCubit>(create: (context) => ChangeRetweetCubit()),
        BlocProvider<ChangePostHeartShapeCubit>(create: (context) => ChangePostHeartShapeCubit()),
        BlocProvider<HomeControllerCubit>(create: (context) => HomeControllerCubit()),



        BlocProvider<UpdatePasswordCubit>(create: (context) => UpdatePasswordCubit(authRepos: AuthRepos(api: DioConsumer(dio: Dio(),isTextModel:false, isImageModel: false)))),

      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: OralCancerApp(seenOnBoard:seenOnBoard ,),
      ),
    );
  }

}