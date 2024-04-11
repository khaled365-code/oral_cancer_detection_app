import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class GenderSelectTextField extends StatefulWidget {
  const  GenderSelectTextField({super.key ,});


  @override
  State<GenderSelectTextField> createState() => _GenderSelectTextFieldState();
}

class _GenderSelectTextFieldState extends State<GenderSelectTextField> {
  String? selectedGender;


  @override
  Widget build(BuildContext context) {

    return TextFormField(
      style:const TextStyle( color:AppColors.background,),
      decoration: InputDecoration(
        labelText:'Gender',
        labelStyle:AppTextStyles.font16.copyWith(
          color: AppColors.background ,
        ),
        hintText:'Select Gender',
        hintStyle:AppTextStyles.font16.copyWith(
          color: AppColors.background ,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(color:AppColors.background),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(color:AppColors.background),
        ),
        suffixIcon: PopupMenuButton<String>(
          icon:const Icon(Icons.arrow_drop_down,color:AppColors.background ,),
          onSelected: (gender) {
            setState(() {
              selectedGender = gender;
            });
          },
          itemBuilder: (BuildContext context) => const  <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Male',
              child: Text('Male'),
            ),
            PopupMenuItem<String>(
              value: 'Female',
              child: Text('Female'),
            ),
          ],
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a gender';
        }
        return null;
      },
      readOnly: true,
      controller: TextEditingController(text: selectedGender),
    );
  }
}
