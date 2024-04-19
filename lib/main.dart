import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_locale.dart';
import 'package:graduation_project/features/home/presentation/manager/upload_image_cubit.dart';
import 'package:graduation_project/features/profile/presentation/manager/change_language_cubit.dart';
import 'package:graduation_project/features/profile/presentation/manager/change_theme_cubit.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'generated/l10n.dart';


void main() {
  runApp(const MyApp());
}

class MyAppWithLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
         builder: (context, state) {
          return MaterialApp(
          theme:context.read<ChangeThemeCubit>().isDarkMode?ThemeData.dark():ThemeData.light(),
          locale:  Locale(BlocProvider.of<ChangeLanguageCubit>(context).languageCode),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: const
           [
            Locale('ar',"EG"),
            Locale('en',"Us"),
            ],
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
        BlocProvider<ChangeLanguageCubit>(create: (context) => ChangeLanguageCubit()),
        BlocProvider<UploadImageCubit>(create: (context) => UploadImageCubit()),
        BlocProvider<ChangeThemeCubit>(create: (context) => ChangeThemeCubit()),

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


