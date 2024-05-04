import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/lotties_constants.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/colors.dart';

class OnboardingScreen extends StatelessWidget {
   OnboardingScreen({super.key, });
  @override
  Widget build(BuildContext context) {

    List<PageViewModel> getPages=[
      PageViewModel(
        decoration: PageDecoration(pageColor: AppColors.background),
          titleWidget:Text('firstonboardtilte'.tr(context),style: AppTextStyles.font24,textAlign: TextAlign.center),
          bodyWidget: Text( 'firstonboarddesc'.tr(context), style: AppTextStyles.font16.copyWith(color: Colors.grey),textAlign: TextAlign.center)
         , image: Padding(
           padding: const EdgeInsets.only(left: 60),
           child: Lottie.asset(AppLoties.firstOnBoradLottie),
         )
      ),
      PageViewModel(
          decoration: PageDecoration(pageColor: AppColors.background),
          titleWidget: Text('secondonboardtitle'.tr(context),style: AppTextStyles.font24,textAlign: TextAlign.center),
          bodyWidget: Text('secondonboarddesc'.tr(context),style: AppTextStyles.font16.copyWith(color: Colors.grey),textAlign: TextAlign.center)
        ,  image: Lottie.asset(AppLoties.secondOnBoradLottie)
      ),
    ];
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: IntroductionScreen(
            pages: getPages,
            next:  Text('Next'.tr(context),style: AppTextStyles.font12.copyWith(color:AppColors.primary )),
            showNextButton: true,
            skip:  Text('skip'.tr(context),style: AppTextStyles.font12.copyWith(color:AppColors.primary ),),
            onSkip: (){navigate(context: context, route: Routes.registerScreen);},
            showSkipButton: true,
            done:  Text('Finish'.tr(context),style: AppTextStyles.font12.copyWith(color:AppColors.primary )),
            onDone: (){navigate(context: context, route: Routes.registerScreen);},


            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(30.0, 10.0),
              activeColor: AppColors.primary,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              ),
            ),
          ),
        )
      ),
    );
  }

  Future<bool> isFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTimeUser') ?? true;
  }
}