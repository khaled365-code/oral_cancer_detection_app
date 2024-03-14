
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/community/presentation/screens/community_home.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/result_view.dart';
import 'package:graduation_project/features/profile/presentation/screens/about_app_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/edit_profile.dart';
import 'package:graduation_project/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/feedback_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/settings_screen.dart';
import 'package:graduation_project/features/splash/presentation/views/splash_screen.dart';
import '../../features/auth/presentation/views/log_as_screen.dart';
import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/regisrer_screen.dart';
import '../../features/auth/presentation/views/reset_pass_screen.dart';
import '../../features/auth/presentation/views/send_code_screen.dart';
import '../../features/diagnosis/presentation/views/Radio_question_view.dart';
import '../../features/diagnosis/presentation/views/text_question_view.dart';
import '../../features/home/presentation/views/doctor_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/profile/presentation/screens/faq_screen.dart';
import '../../features/splash/presentation/views/onboearding_screen.dart';

class Routes
{
  static const String home='/';
  static  const String splash  = '/splash_Page';
  static  const String doctor  = '/Doctor_Page';
  static const String editProfilescreen='/edit_profile';
  static const String settings='/setting_screen';
  static const String aboutApp='/about_app_screen';
  static const String faqscreen='/faq_screen';
  static const String feedbackscreen='/feedback_screen';
  static const String privacypolicyscreen='/privacy_policy_screen';
  static const String communityhomescreen='/community_home_screen';
  static const String onBoard='/onBoarding_screen';
  static const String logAs='/Log_as_screen';
  static const String loginScreen='/Login_screen';
  static const String registerScreen='/register_screen';
  static const String resetNewPass='/reset_new_pass';
  static const String sendCode='/sendCode';
  static const String radioQueastion='/radioQueastion';
  static const String textQuestion='/textQuestion';
  static const String result='/result';

}

class AppRoutes
{

  static Route? onGenerateRoutes(RouteSettings routeSettings)
  {
    switch(routeSettings.name)
    {
      case Routes.home:
        return MaterialPageRoute(builder: (context) =>const HomePage(),);
      case Routes.result:
        return MaterialPageRoute(builder: (context) =>const ResultScreen(),);
      case Routes.radioQueastion:
        return MaterialPageRoute(builder: (context) =>const QuestionChoice(),);
      case Routes.textQuestion:
        return MaterialPageRoute(builder: (context) =>const QuestionText(),);
      case Routes.resetNewPass:
        return MaterialPageRoute(builder: (context) => const ResetPassword(),);
      case Routes.sendCode:
        return MaterialPageRoute(builder: (context) => const SendCode(),);
      case Routes.onBoard:
        return MaterialPageRoute(builder: (context) => OnboardingScreen(),);
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage(),);
      case Routes.logAs:
        return MaterialPageRoute(builder: (context) => const LogAs(),);
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginPage(),);
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterPage(),);
      case Routes.doctor:
        return MaterialPageRoute(builder: (context) => const DoctorPage(),);

      case Routes.editProfilescreen:
        return MaterialPageRoute(builder: (context) => EditProfileScreen(),);
      case Routes.settings:
        return MaterialPageRoute(builder: (context) => SettingsScreen(),);
      case Routes.aboutApp:
        return MaterialPageRoute(builder: (context) => AboutAppScreen(),);
      case Routes.faqscreen:
        return MaterialPageRoute(builder: (context) => FaqScreen(),);
      case Routes.feedbackscreen:
        return MaterialPageRoute(builder: (context) => FeedBackScreen(),);
      case Routes.privacypolicyscreen:
        return MaterialPageRoute(builder: (context) => PrivacyPolicyScreen(),);
      case Routes.communityhomescreen:
        return MaterialPageRoute(builder: (context) => CommunityScreen(),);
      default:
        return MaterialPageRoute(builder: (context) => const Center(child: Text('No screen found')),);

    }


  }

}