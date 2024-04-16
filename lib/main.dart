
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/profile/presentation/manager/change_language_cubit.dart';
import 'core/routes/app_routes.dart';
import 'generated/l10n.dart';


void main() {
  runApp(const MyApp());
}

class MyAppWithLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
              textTheme: const TextTheme()),

          locale:  Locale(BlocProvider.of<ChangeLanguageCubit>(context).languageCode),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeLanguageCubit(),
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MyAppWithLanguage(),
      ),
    );
  }

}


