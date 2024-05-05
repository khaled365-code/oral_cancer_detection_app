import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/features/auth/data/manager/log_out_cubit.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/features/auth/data/manager/sign_up_cubit.dart';
import 'package:graduation_project/features/auth/data/manager/update_password_cubit.dart';
import 'package:graduation_project/features/auth/data/repos/auth_repos.dart';
import 'package:graduation_project/features/home/presentation/manager/upload_image_cubit.dart';
import 'package:graduation_project/features/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'core/cache/cache_helper.dart';
import 'core/commons/bloc_obsever.dart';
import 'core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'core/commons/global_cubits/change_theme_cubit/change_theme_cubit.dart';
import 'core/commons/global_cubits/get_profile_data_cubit/profile_cubit.dart';
import 'core/localization/app_localization.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'features/profile/data/repos/profile_repos.dart';


void main() {
  Bloc.observer=MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyAppWithLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
         builder: (context, state) {
          return MaterialApp(

            builder: DevicePreview.appBuilder,
          theme:context.read<ChangeThemeCubit>().isDarkMode?ThemeData.dark():ThemeData.light(),
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
          initialRoute: Routes.splash,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
        );
  },
);
      },
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProfileDataCubit>(create: (context) => GetProfileDataCubit(profileRepo: ProfileRepos(api: DioConsumer(dio: Dio())))..GetUserProfile(),),
        BlocProvider<ChangeLanguageCubit>(create: (context) => ChangeLanguageCubit()),
        BlocProvider<GlobalCommunityBloc>(create: (context) => GlobalCommunityBloc()),
        BlocProvider<UpdateProfileCubit>(create: (context) => UpdateProfileCubit(
            profileRepos: ProfileRepos(api: DioConsumer(dio: Dio()))
        ),),

        BlocProvider<UploadImageCubit>(create: (context) => UploadImageCubit()),
        BlocProvider<ChangeThemeCubit>(create: (context) => ChangeThemeCubit()),
       // BlocProvider<SignInCubit>(create: (context) => SignInCubit(AuthRepos(api: DioConsumer(dio: Dio())))),
        BlocProvider<UpdatePasswordCubit>(create: (context) => UpdatePasswordCubit(authRepos: AuthRepos(api: DioConsumer(dio: Dio())))),
        BlocProvider<SignUpCubit>(create:
            (context)=>SignUpCubit(authRepos: AuthRepos(api: DioConsumer(dio:Dio())))),
        BlocProvider<LogOutCubit>(create:
          (context)=>(LogOutCubit(authRepos: AuthRepos(api: DioConsumer(dio:Dio())))),
        ),

      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MyAppWithLanguage(),
      ),
    );
  }

}


