import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

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
      style:const TextStyle( color: Colors.black ,),
      decoration: InputDecoration(
        labelText:'Gender',
        labelStyle:const TextStyle(
          color: Colors.black ,
          fontSize: 16 ,) ,
        hintText:'Select Gender',
        hintStyle:const TextStyle(
          color: Colors.black ,
          fontSize:16 ,) ,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(color:AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(color:AppColors.primary),
        ),
        suffixIcon: PopupMenuButton<String>(
          icon:const Icon(Icons.arrow_drop_down),
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
