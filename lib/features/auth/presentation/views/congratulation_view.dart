import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:lottie/lottie.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
  
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 6),(){
      navigate(context: context, route: Routes.loginScreen);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: Column(
          children: [
            Lottie.asset('assets/images/animation.json'),
            const Text("Congratulation!",style: AppTextStyles.font26,)
          ],
        ),
      ),
    );
  }
}
