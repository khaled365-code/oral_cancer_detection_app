import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/row_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RowTitle(),
            const SizedBox(height:90,),
            const  CustomContainer(conHeight:190,conWidth:230,conImage:AppAssets.splash),
            const SizedBox(height:14,),
            Text(
              'Oral Cancer Detection System ',
              textAlign: TextAlign.center,
              style: AppTextStyles.font24.copyWith(color: AppColors.primary)
            ),
            const SizedBox(height: 8,),
            Text(
              'Healthcare System',
              textAlign: TextAlign.center,
              style:AppTextStyles.font10.copyWith(
                  color: AppColors.primary,
                  fontFamily: 'lato', )
            ),
            const SizedBox(
              height:50,
            ),
            AnimatedBuilder(
              animation: slidingAnimation,
              builder: (context,_){
                return SlideTransition(
                    position: slidingAnimation,
                   child: CustomButton(
                    onTap: (){
                      navigate(context: context, route: Routes.onBoard);
                    },
                    buttonText: 'Get Started',
                  ),
                );
              },

            ),
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController=AnimationController(
      vsync: this,
      duration:const Duration(seconds:3),
    );
    slidingAnimation=
        Tween<Offset>(begin:const Offset(0,20),end:const Offset(0, 0)).animate(animationController);
    animationController.forward();
  }
}

