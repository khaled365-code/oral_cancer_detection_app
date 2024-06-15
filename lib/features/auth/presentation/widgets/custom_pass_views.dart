import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import '../../../../../core/utilis/image_constants.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';


class CustomPassViews extends StatelessWidget {
  const CustomPassViews({Key? key,   this.buttonPress,   this.buttonText,required this.mainTitle,required this.subTitle,this.centerWidget}) : super(key: key);
  final String mainTitle;
  final String subTitle;
  final Widget? centerWidget;
  final String? buttonText;
  final VoidCallback? buttonPress;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsetsDirectional.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height*0.02,),
                ClipOval(
                  child: Image.asset(ImageConstants.lock,width: width*0.3,),
                ),
                SizedBox(height: height*0.03,),
                Text(mainTitle,style: AppTextStyles.font26),

                Padding(
                  padding:   EdgeInsetsDirectional.symmetric(horizontal: 38.w,vertical: 10.h),
                  child: Text(subTitle,textAlign: TextAlign.center,style:
                  AppTextStyles.font14.copyWith(color: AppColors.semiBlack)),
                ),
                SizedBox(height: height*0.001,),
               centerWidget!,
                SizedBox(height:height*0.04 ,),
              checkNull()


              ],),
          ),
        ),
      ),
    );
  }
   Widget checkNull(){
    if(buttonPress ==null && buttonText ==null){
      return SizedBox(height: 10,);
    }
    else{
      return CustomElevatedButton(

        buttonBackground: AppColors.primary,
        onpress:buttonPress!
        , child: Text(buttonText!,style:AppTextStyles.font14.copyWith(color: AppColors.white) ,),
      );
    }
  }
}