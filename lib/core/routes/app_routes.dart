



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/community/presentation/screens/community_home.dart';
import 'package:graduation_project/features/profile/presentation/screens/about_app_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/edit_profile.dart';
import 'package:graduation_project/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/feedback_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/settings_screen.dart';
import 'package:graduation_project/features/splash/presentation/screens/splash_screen.dart';

import '../../features/profile/presentation/screens/faq_screen.dart';
import '../../features/profile/presentation/screens/home_screen.dart';

import '../../features/splash/presentation/screens/onboearding_screen.dart';

class Routes
{

  static const String home='/';
  static  const String splash  = 'splash_Page';
  static const String editProfilescreen='/edit_profile';
  static const String settings='/setting_screen';
  static const String aboutApp='/about_app_screen';
  static const String faqscreen='/faq_screen';
  static const String feedbackscreen='/feedback_screen';
  static const String privacypolicyscreen='/privacy_policy_screen';
  static const String communityhomescreen='/community_home_screen';
  static const String onBoard='/onBoarding_screen';









}

class AppRoutes
{

  static Route? onGenerateRoutes(RouteSettings routeSettings)
  {
    switch(routeSettings.name)
    {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen(),);
      case Routes.onBoard:
        return MaterialPageRoute(builder: (context) => OnboardingScreen(),);
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage(),);

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