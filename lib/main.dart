import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/core/commons/global_cubits/get_profile_data_cubit/profile_cubit.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/features/auth/data/manager/sign_up_cubit.dart';
import 'package:graduation_project/features/auth/data/manager/update_password_cubit.dart';
import 'package:graduation_project/features/auth/data/repos/auth_repos.dart';
import 'package:graduation_project/features/community/data/repos/community_repo_implementation.dart';
import 'package:graduation_project/features/diagnosis/presentation/manager/image_cubit/image_diagnosis_cubit.dart';
import 'package:graduation_project/features/home/presentation/manager/upload_image_cubit.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';
import 'core/cache/cache_helper.dart';
import 'core/commons/bloc_obsever.dart';
import 'core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'core/commons/global_cubits/change_theme_cubit/change_theme_cubit.dart';
import 'core/localization/app_localization.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'features/diagnosis/data/repo/ai_repo.dart';
import 'features/diagnosis/presentation/manager/questions_cubit/question_diagnosis_cubit.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper().init();
  bool seenOnBorading=CacheHelper().getData(key: 'seenOnboarding')??false;
  runApp(MyApp(seenOnBoard: seenOnBorading,),);
  Bloc.observer=MyBlocObserver();

}

class MyAppWithLanguage extends StatelessWidget {
  MyAppWithLanguage({ required this.seenOnBoard});
 final bool seenOnBoard;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
         builder: (context, state) {
          return MaterialApp(

          theme:context.read<ChangeThemeCubit>().isDarkMode==true?ThemeData.dark():ThemeData.light(),
          themeMode: ThemeMode.system,
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
          initialRoute: seenOnBoard?Routes.loginScreen:Routes.splash,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
        );
  },
);
      },
    );
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
        BlocProvider<ImageDiagnosisCubit>(create: (context) => ImageDiagnosisCubit(aiRepository: AiRepository(api: DioConsumer(dio: Dio(), isTextModel:false, isImageModel:true,))) ),
        BlocProvider<GetProfileDataCubit>(create: (context) => GetProfileDataCubit(profileRepoImplementation: ProfileRepoImplementation(api: DioConsumer(dio: Dio(),isTextModel:false, isImageModel: false,)))),
        BlocProvider<ChangeLanguageCubit>(create: (context) => ChangeLanguageCubit()),
        BlocProvider<GlobalCommunityBloc>(create: (context) => GlobalCommunityBloc(communityRepoImplementation: CommunityRepoImplementation(api: DioConsumer(dio: Dio(),isTextModel:false, isImageModel: false)))..getAllPostsFun()),
        BlocProvider<UploadImageCubit>(create: (context) => UploadImageCubit()),
        BlocProvider<ChangeThemeCubit>(create: (context) => ChangeThemeCubit()),
        // BlocProvider<SignInCubit>(create: (context) => SignInCubit(AuthRepos(api: DioConsumer(dio: Dio())))),
      //  BlocProvider<UpdatePasswordCubit>(create: (context) => UpdatePasswordCubit(authRepos: AuthRepos(api: DioConsumer(dio: Dio(),isTextModel:false, isImageModel: false)))),
        BlocProvider<SignUpCubit>(create:
            (context)=>SignUpCubit(authRepos: AuthRepos(api: DioConsumer(dio:Dio(),isTextModel:false, isImageModel: false)))),

      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MyAppWithLanguage(seenOnBoard:seenOnBoard ,),
      ),
    );
  }

}


