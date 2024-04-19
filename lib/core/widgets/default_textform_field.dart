import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

import '../utilis/colors.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.obscureValue = false,
    this.suffixIcon,
    this.controller,
    this.prefixIcon,
    this.inputType,
    this.onChangeee,
    this.readOnly=false,
    this.enabledBorderSIdeColor=AppColors.primary,
    this.focusedBorderSIdeColor=AppColors.primary,
    this.hintColor,
    this.labelColor,
    this.textColor
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final bool? obscureValue;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final Color? textColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color focusedBorderSIdeColor;
  final Color enabledBorderSIdeColor;
  final TextInputType? inputType;
  final Function(String)? onChangeee;
  final bool readOnly;

  @override
  State<DefaultTextFormField>  createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      style:  TextStyle(
        color: widget.textColor,
      ),
      keyboardType:widget.inputType,
      onChanged:widget.onChangeee,
      obscureText: widget.obscureValue!,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: AppTextStyles.font16.copyWith(color: widget.labelColor)
        ,hintText: widget.hintText,
        hintStyle:  AppTextStyles.font16.copyWith(color: widget.hintColor)
        ,enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:  BorderSide(color:widget.enabledBorderSIdeColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:  BorderSide(color:widget.focusedBorderSIdeColor),
        ),
        prefixIcon:widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding:  EdgeInsetsDirectional.symmetric(vertical: 18.h, horizontal: 16.w),
      ),
    );
  }
}