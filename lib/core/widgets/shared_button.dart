
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_khaled_styles.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

class SharedButton extends StatelessWidget {

  final String btnText;
  final Color? textcolor;
  final double? height;
  final TextStyle? btnTextStyle;
  final Color? buttonColor;
  final void Function() onPressed;
  final bool hasBorderRadius;
  final double? borderRadiusValue;
  final double? width;
  final bool hasBorder;

  const SharedButton({required this.btnText,this.textcolor,required this.onPressed,this.height,this.btnTextStyle,this.buttonColor, this.hasBorderRadius=false, this.borderRadiusValue, this.width, this.hasBorder=false,});
  @override

  Widget build(BuildContext context) {

  return Container(
    width: (width??150.w),
    height: (height??30.h),
    decoration: BoxDecoration(
      border: hasBorder?Border.all(
        color: AppColors.primary,
      ):null,
    borderRadius: hasBorderRadius?BorderRadius.circular(borderRadiusValue!):null,
    color: buttonColor??AppColors.primary,),
    child:MaterialButton(
      onPressed: onPressed,
      child: Center(child: Text(btnText,style:btnTextStyle??AppKhaledStyles.textStyle()),)),
    );

  }
}

