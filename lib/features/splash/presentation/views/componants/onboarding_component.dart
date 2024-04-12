import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';

import '../../../../../core/widgets/custom_text_button.dart';


class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Widget? textButton;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Padding(
           padding: const EdgeInsets.only(left: 290,top: 0),
           child: textButton,
         )
          ,Image.asset(imagePath,width: 350,),
          const SizedBox(height: 20),
          Text( textAlign: TextAlign.center,
            title,
            style:AppTextStyles.font24
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.font16.copyWith(color: Colors.grey)
          ),
        ],
      ),
    );
  }
}

