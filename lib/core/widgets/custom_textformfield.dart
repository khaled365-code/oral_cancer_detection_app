import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

class CustomTextFormField extends StatelessWidget{
  CustomTextFormField({super.key , required this.labelText , required this.hintText,
    this.obscureValue=false , this.suffixIcon , this.controller});

  String? labelText;
  String hintText;
  bool? obscureValue;
  IconButton? suffixIcon;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      style:const TextStyle(
        color: Colors.black ,),
      obscureText:obscureValue!,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:const TextStyle(
          color: Colors.black ,
          fontSize: 16 ,
        ) ,
        hintText: hintText,
        hintStyle:const TextStyle(
          color: Colors.black ,
          fontSize:16 ,
        ) ,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(color:AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(color:AppColors.primary),
        ),
        suffixIcon: suffixIcon ,
        contentPadding: const EdgeInsets.symmetric(vertical:18, horizontal: 16),

      ),

    );
  }



}