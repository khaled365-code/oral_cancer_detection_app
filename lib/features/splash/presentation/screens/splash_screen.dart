import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/features/splash/presentation/componants/custom_button.dart';
import 'package:graduation_project/features/splash/presentation/componants/custom_container.dart';
import 'package:graduation_project/features/splash/presentation/componants/row_title.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
            const SizedBox(
              height:14,
            ),
            const Text(
              'Oral Cancer Detection System ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Healthcare System',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color:AppColors.primary,
              ),
            ),
            const SizedBox(
              height:50,
            ),
            CustomButton(
              onTap: (){
                navigate(context: context, route: Routes.onBoard);

              },
              buttonText: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}

