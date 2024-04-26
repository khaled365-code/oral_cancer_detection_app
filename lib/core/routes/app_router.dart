import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/auth/presentation/views/congratulation_view.dart';
import 'package:graduation_project/features/auth/presentation/views/otp_verfication_view.dart';
import 'package:graduation_project/features/community/presentation/screens/add_post_screen.dart';
import 'package:graduation_project/features/community/presentation/screens/community_screen.dart';
import 'package:graduation_project/features/community/presentation/screens/no_posts_screen.dart';
import 'package:graduation_project/features/community/presentation/screens/search_posts_screen.dart';
import 'package:graduation_project/features/community/presentation/screens/post_details_screen.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/questions_view.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/result_view.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repos.dart';
import 'package:graduation_project/features/profile/presentation/manager/profile_cubites/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/manager/profile_cubites/update_profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/screens/about_app_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/edit_profile.dart';
import 'package:graduation_project/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/feedback_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/profile_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/settings_screen.dart';
import 'package:graduation_project/features/splash/presentation/views/splash_screen.dart';
import '../../features/auth/data/manager/sign_in_cubit.dart';
import '../../features/auth/data/repos/auth_repos.dart';
import '../../features/auth/presentation/views/log_as_screen.dart';
import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/regisrer_screen.dart';
import '../../features/auth/presentation/views/reset_pass_screen.dart';
import '../../features/auth/presentation/views/send_code_screen.dart';
import '../../features/diagnosis/presentation/views/Radio_question_view.dart';
import '../../features/community/presentation/screens/post_with_image_screen.dart';
import '../../features/diagnosis/presentation/views/text_question_view.dart';
import '../../features/home/presentation/views/doctor_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/profile/presentation/screens/faq_screen.dart';
import '../../features/splash/presentation/views/onboearding_screen.dart';
import '../../main.dart';




class AppRoutes
{

  static Route? onGenerateRoutes(RouteSettings routeSettings)
  {
    switch(routeSettings.name)
    {
      case Routes.home:
        return MaterialPageRoute(builder: (context) =>const HomePage(),);
      case Routes.postWitImageScreen:
        return MaterialPageRoute(builder: (context) =>const PostWithImageScreen(),);
      case Routes.noPostsScreen:
        return MaterialPageRoute(builder: (context) =>const NoPostsScreen(),);
      case Routes.searchPostsScreen:
        return MaterialPageRoute(builder: (context) =>const SearchPostsScreen(),);
      case Routes.postDetailsScreen:
        return MaterialPageRoute(builder: (context) =>const PostDetailsScreen(),);
      case Routes.addPostScreen:
        return MaterialPageRoute(builder: (context) => AddPostScreen(),);
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (context) => const OtpVerifyScreen(),);
      case Routes.questionsView:
        return MaterialPageRoute(builder: (context) => const QuestionsView(),);
      case Routes.congratulationScreen:
        return MaterialPageRoute(
          builder: (context) => const CongratulationScreen(),);
      case Routes.result:
        return MaterialPageRoute(builder: (context) => const ResultScreen(),);
    // case Routes.radioQueastion:
    //   return MaterialPageRoute(builder: (context) =>const QuestionChoice(),);
      case Routes.textQuestion:
        return MaterialPageRoute(builder: (context) => const QuestionText(),);
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
        return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context)=>SignInCubit(AuthRepos(api: DioConsumer(dio: Dio()))),
            child: const LoginPage()),);
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterPage(),);
      case Routes.doctor:
        return MaterialPageRoute(builder: (context) => const DoctorPage(),);

      case Routes.editProfilescreen:
        return MaterialPageRoute(builder: (context) =>
            EditProfileScreen(),);
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
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) =>
                  ProfileCubit(profileRepo: ProfileRepos(api: DioConsumer(
                      dio: Dio()))),
              child: ProfileScreen(),
            ),);
      default:
        return MaterialPageRoute(
          builder: (context) => const Center(child: Text('No screen found')),);
    }


  }

}