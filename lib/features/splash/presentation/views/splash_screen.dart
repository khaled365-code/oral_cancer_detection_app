import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/row_title.dart';
import '../../../../../core/commons/functions.dart';

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
        padding: EdgeInsetsDirectional.symmetric(vertical: 8.h, horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RowTitle(),
             SizedBox(height:90.h,),
              CustomContainer(conHeight:190.h,conWidth:230.w,conImage:ImageConstants.splash),
             SizedBox(height:14.h,),
            Text(
                "oralCancerDetectionSystem".tr(context),
              textAlign: TextAlign.center,
              style: AppTextStyles.font24.copyWith(color: AppColors.primary)
            ),
             SizedBox(height: 8.h,),
            Text(
                "healthcareSystem".tr(context),
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
                    buttonText:"getStarted".tr(context),
                  ),
                );
              },

            ),
            Padding(
              padding:  EdgeInsetsDirectional.only(top: 20.h),
              child: GestureDetector(
                onTap: ()
                {
                  navigate(context: context, route: Routes.home);
                },
                child: Container(
                  width: 80.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.c4C9EEB,
                  ),
                  child: Center(
                    child: Text('Home',style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      size: 15,
                      weight: FontWeight.w700
                    ),),
                  ),
                ),
              ),
            )
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

