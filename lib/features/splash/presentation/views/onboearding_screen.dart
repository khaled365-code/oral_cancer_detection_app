import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/utilis/app_colors.dart';
import 'componants/pageview_component.dart';

class OnboardingScreen extends StatelessWidget {
   OnboardingScreen({super.key, });
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: PageViewOnBoarding(),
      ),
    );
  }

}