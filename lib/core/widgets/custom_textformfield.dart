import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
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
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final bool? obscureValue;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final TextInputType? inputType;
  final Function(String)? onChangeee;
  final bool readOnly;

  @override
  State<CustomTextFormField>  createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
        color: AppColors.background,
      ),
      keyboardType:widget.inputType,
      onChanged:widget.onChangeee,
      obscureText: widget.obscureValue!,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle:  TextStyle(
          color:AppColors.background,
          fontSize: 16,
        ),
        hintText: widget.hintText,
        hintStyle:  TextStyle(
          color:AppColors.background,
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(color:AppColors.background),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(color:AppColors.background),
        ),
        prefixIcon:widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      ),
    );
  }
}