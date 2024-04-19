import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/colors.dart';
import 'componants/pageview_component.dart';
import '../../../../../core/commons/functions.dart';


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