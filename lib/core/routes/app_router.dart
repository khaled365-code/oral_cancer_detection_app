import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/features/auth/data/manager/sign_up_cubit.dart';
import 'package:graduation_project/features/auth/presentation/views/congratulation_view.dart';
import 'package:graduation_project/features/auth/presentation/views/otp_verfication_view.dart';
import 'package:graduation_project/features/community/presentation/screens/add_post_screen.dart';
import 'package:graduation_project/features/community/presentation/screens/add_comment_screen.dart';
import 'package:graduation_project/features/community/presentation/screens/community_screen.dart';
import 'package:graduation_project/features/community/presentation/screens/no_posts_screen.dart';
import 'package:graduation_project/features/community/presentation/screens/post_details.dart';
import 'package:graduation_project/features/community/presentation/screens/search_posts_screen.dart';
import 'package:graduation_project/features/diagnosis/data/repo/ai_repo.dart';
import 'package:graduation_project/features/diagnosis/presentation/cubits/image_cubit/image_diagnosis_cubit.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/diagnosis_result_view.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/questions_view.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/result_view.dart';
import 'package:graduation_project/features/home/presentation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:graduation_project/features/home/presentation/views/news_search_screen.dart';
import 'package:graduation_project/features/home/presentation/cubits/initial_home_screen_cubit/initial_home_screen_cubit.dart';
import 'package:graduation_project/features/home/presentation/views/complete_news_article.dart';
import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'package:graduation_project/features/home/presentation/views/for_you_article.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:graduation_project/features/profile/presentation/cubits/contact_us_cubit/contact_us_bloc_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubits/faq_screen_cubit/faq_screen_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubits/help_screen_cubit/help_screen_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubits/privacy_screen_cubit/privacy_screen_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubits/update_password_cubit/update_password_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/screens/about_app_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/dark_mode.dart';
import 'package:graduation_project/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/help_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/initial_profile_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/privacy_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/feedback_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/settings_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/terms_and_conditions_screen.dart';
import 'package:graduation_project/features/splash/presentation/views/splash_screen.dart';
import '../../features/auth/data/manager/sign_in_cubit.dart';
import '../../features/auth/data/repos/auth_repos.dart';
import '../../features/auth/presentation/views/log_as_screen.dart';
import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/regisrer_screen.dart';
import '../../features/auth/presentation/views/reset_pass_screen.dart';
import '../../features/auth/presentation/views/send_code_screen.dart';
import '../../features/community/presentation/screens/post_with_image_screen.dart';
import '../../features/home/presentation/views/doctor_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/profile/presentation/screens/contact_us_screen.dart';
import '../../features/profile/presentation/screens/faq_screen.dart';
import '../../features/profile/presentation/screens/put_new_password_screen.dart';
import '../../features/splash/presentation/views/onboearding_screen.dart';


class AppRoutes {

  static Route? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) =>
            MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SearchNewsCubit(),
              ),
              BlocProvider(
                create: (context) => InitialHomeScreenCubit(),
              ),
            ],
            child: HomePage(),
          ),);
      case Routes.darkModeScreen:
        return MaterialPageRoute(builder: (context) => const DarkModeScreen(),);
      case Routes.postDetails:
        return MaterialPageRoute(builder: (context) => const PostDetails(),settings: routeSettings);
      case Routes.forYouArticle:
        return MaterialPageRoute(builder: (context) => const ForYouArticle(),settings: routeSettings);
      case Routes.completeNewsArticle:
        return MaterialPageRoute(builder: (context) => const CompleteNewsArticle(),settings: routeSettings);

      case Routes.initialProfileScreen:
        return MaterialPageRoute(builder: (context) =>  ProfileOutScreen(),);
      case Routes.commentScreen:
        return MaterialPageRoute(builder: (context) => const CommentScreen(),settings: routeSettings);
      case Routes.termsAndConditionsScreen:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsScreen(),);
      case Routes.helpScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => HelpScreenCubit(),
              child: HelpScreen(),
            ),);
      case Routes.postWitImageScreen:
        return MaterialPageRoute(
          builder: (context) => const PostWithImageScreen(),);
      case Routes.noPostsScreen:
        return MaterialPageRoute(builder: (context) => const NoPostsScreen(),);
      case Routes.searchPostsScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchPostsScreen(),);
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
        return MaterialPageRoute(builder: (context) => const DiagnosisResultView(),);

      case Routes.resetNewPass:
        return MaterialPageRoute(builder: (context) => const ResetPassword(),);
      case Routes.putNewPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => UpdatePasswordFromSettingsCubit(profileRepoImplementation: ProfileRepoImplementation(api:DioConsumer(dio: Dio(), isTextModel:false, isImageModel: false))),
              child: const PutNewPasswordScreen()),);
      case Routes.sendCode:
        return MaterialPageRoute(builder: (context) => const SendCode(),);
      case Routes.onBoard:
        return MaterialPageRoute(builder: (context) => OnboardingScreen(),);
      case Routes.contactUsScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => ContactUsBloc(),
              child: ContactUsScreen(),
            ),);
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage(),);
      case Routes.logAs:
        return MaterialPageRoute(builder: (context) => const LogAs(),);
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
                create: (context) =>
                    SignInCubit(AuthRepos(api: DioConsumer(dio: Dio(),isTextModel:false, isImageModel: false))),
                child: const LoginPage()),);
      case Routes.registerScreen:
             return MaterialPageRoute(builder: (context) =>  BlocProvider(
             create: (context) => SignUpCubit(authRepos: AuthRepos(api:DioConsumer(dio: Dio(), isTextModel: false, isImageModel: false))),
               child: RegisterPage(),
),);
      case Routes.doctor:
        return MaterialPageRoute(builder: (context) => const DoctorPage(),);

      case Routes.editProfilescreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => UpdateProfileCubit(profileRepo: ProfileRepoImplementation(
                    api: DioConsumer(dio: Dio(), isTextModel:false, isImageModel: false))),
            child: EditProfileScreen(),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(builder: (context) => SettingsScreen(),);
      case Routes.searchNewsScreen:
        return MaterialPageRoute(builder: (context) => NewsSearchScreen(),
        );
      case Routes.aboutApp:
        return MaterialPageRoute(builder: (context) => AboutAppScreen(),);
      case Routes.faqscreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => FaqScreenCubit(),
              child: FaqScreen(),
            ),);
      case Routes.feedbackscreen:
        return MaterialPageRoute(builder: (context) => FeedBackScreen(),);
      case Routes.privacypolicyscreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => PrivacyScreenCubit(),
              child: PrivacyPolicyScreen(),
            ),);
      case Routes.communityhomescreen:
        return MaterialPageRoute(builder: (context) => CommunityScreen(),settings: routeSettings);
      case Routes.UploadImageView:
        return MaterialPageRoute(builder: (context) => BlocProvider(
            create: (context) => ImageDiagnosisCubit(
           aiRepository: AiRepository(
              api: DioConsumer(
                  dio: Dio(),
                  isTextModel: false,
                  isImageModel: true))),
            child: UploadImageView(),
),);
      default:
        return MaterialPageRoute(
          builder: (context) => const Center(child: Text('No screen found')),);

    }
  }

}