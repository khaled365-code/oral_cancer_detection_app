import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/commons.dart';
import 'componants/pageview_component.dart';

class OnboardingScreen extends StatefulWidget {
   OnboardingScreen({super.key, });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();

    isFirstTimeUser().then((isFirstTime) {
      if (!isFirstTime) {
        navigate(context: context, route: Routes.loginScreen);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: PageViewOnBoarding(),
      ),
    );
  }
  Future<bool> isFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTimeUser') ?? true;
  }
}