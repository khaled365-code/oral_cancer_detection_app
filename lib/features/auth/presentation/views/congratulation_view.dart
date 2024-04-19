import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/commons/functions.dart';
import '../../../../generated/l10n.dart';

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
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/animation.json'),
           Text(S.of(context).congratulation,style: AppTextStyles.font26,)
        ],
      ),
    );
  }
}
