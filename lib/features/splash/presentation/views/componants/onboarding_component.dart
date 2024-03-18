import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';


class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,width: 350,),
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

