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
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final bool? obscureValue;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final TextInputType? inputType;
  final Function(String)? onChangeee;

  @override
  State<CustomTextFormField>  createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      style: const TextStyle(
        color: Colors.black,
      ),
      keyboardType:widget.inputType,
      onChanged:widget.onChangeee,
      obscureText: widget.obscureValue!,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color:AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color:AppColors.primary),
        ),
        prefixIcon:widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      ),
    );
  }
}