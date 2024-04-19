import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/routes.dart';
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
              'S.of(context).oralCancerDetectionSystem',
              textAlign: TextAlign.center,
              style: AppTextStyles.font24.copyWith(color: AppColors.primary)
            ),
             SizedBox(height: 8.h,),
            Text(
              'S.of(context).healthcareSystem',
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
                    buttonText: 'S.of(context).getStarted',
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

