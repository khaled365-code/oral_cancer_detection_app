



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';


class CustomOutlinedTextField extends StatelessWidget {


  final String? hintText;
  final double? height;
  final Color? crusorColor;
  final bool obsecureText;
  final TextEditingController controller;
  final double? borderRadius;
  // final Color? textFieldColor;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final Color? enabledBorderSideColor;
  final Color? focusedBorderSideColor;
  final void Function(String)? onFieldSubmitte;
  final String? Function(String?)? validator;
  final void Function()? suffixIconOnTap;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;



  const CustomOutlinedTextField({super.key,required this.controller,  this.hintText,this.height,  this.crusorColor, this.obsecureText=false, this.borderRadius, this.hasPrefixIcon=false, this.hasSuffixIcon=false, this.prefixIcon, this.suffixIcon, this.inputFormatters,required this.keyboardType, this.onFieldSubmitte, this.validator, this.suffixIconOnTap, this.enabledBorderSideColor, this.focusedBorderSideColor,  this.textStyle, this.hintTextStyle});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:textStyle??AppTextStyles.font12 ,
      validator: validator,
      onFieldSubmitted: onFieldSubmitte,
      controller: controller,
      cursorColor: crusorColor?? AppColors.white,
      inputFormatters: inputFormatters??null,
      keyboardType: keyboardType,
      obscureText: obsecureText,
    decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(bottom: 5.h,start: 10.h),
        prefixIcon: hasPrefixIcon?Icon(prefixIcon):null,
        suffixIcon: hasSuffixIcon?GestureDetector(
          onTap: suffixIconOnTap,
            child: Icon(suffixIcon,color: AppColors.white,)):null,
        hintText: hintText??null,
        hintStyle: hintTextStyle??AppTextStyles.font14.copyWith(fontWeight: FontWeight.normal,color:AppColors.background.withOpacity(0.5)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:focusedBorderSideColor??AppColors.cEFEFEF ),
            borderRadius: BorderRadius.circular((borderRadius??8).r),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((borderRadius??8).r),
            borderSide: BorderSide(
              color: enabledBorderSideColor??AppColors.cEFEFEF,
                width: 1.2.w
            )
        ),
      ),
    );
  }
}
