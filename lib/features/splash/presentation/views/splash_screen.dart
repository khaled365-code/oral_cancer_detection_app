import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
             SizedBox(height:90.h,),
              CustomContainer(conHeight:190.h,conWidth:230.w,conImage:AppAssets.splash),
             SizedBox(height:14.h,),
            Text(
              'Oral Cancer Detection System ',
              textAlign: TextAlign.center,
              style: AppTextStyles.font24.copyWith(color: AppColors.primary)
            ),
             SizedBox(height: 8.h,),
            Text(
              'Healthcare System',
              textAlign: TextAlign.center,
              style:AppTextStyles.font14.copyWith(
                  color: AppColors.primary,
                  fontFamily: 'lato', )
            ),
             SizedBox(
              height:50.h,
            ),
            AnimatedBuilder(
              animation: slidingAnimation,
              builder: (context,_){
                return SlideTransition(
                    position: slidingAnimation,
                   child: CustomButton(
                     buttonTextColor: AppColors.background,
                     buttonBackground: AppColors.primary,
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
      duration:const Duration(seconds:2),
    );
    slidingAnimation=
        Tween<Offset>(begin:const Offset(0,20),end:const Offset(0, 0)).animate(animationController);
    animationController.forward();
  }
}

