import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/commons.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_textformfield.dart';

class CustomPassViews extends StatelessWidget {
  const CustomPassViews({Key? key,required this.buttonPress,required this.buttonText,required this.mainTitle,required this.subTitle,this.centerWidget}) : super(key: key);
  final String mainTitle;
  final String subTitle;
  final Widget? centerWidget;
  final String buttonText;
  final VoidCallback buttonPress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(AppAssets.lock,width: 100.w,),
            ),
            SizedBox(height: 20.h,),
            Text(mainTitle,style: AppTextStyles.font26),

            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 38,vertical: 10),
              child: Text(subTitle,textAlign: TextAlign.center,style:
              AppTextStyles.font14.copyWith(color: AppColors.semiBlack)),
            ),
            SizedBox(height: 10.h,),
           centerWidget!,
            SizedBox(height:30.h ,),
            CustomElevatedButton(

              buttonBackground: AppColors.primary,
              onpress:buttonPress
              , child: Text(buttonText,style:AppTextStyles.font14.copyWith(color: AppColors.white) ,),
            )
          ],),
      ),
    );
  }
}