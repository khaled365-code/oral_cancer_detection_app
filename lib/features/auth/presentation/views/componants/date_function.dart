import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

class DateFunction {
  DateTime birthDate = DateTime.now();

  Future<DateTime?> selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:AppColors.primary,
            colorScheme:const ColorScheme.light(primary:AppColors.primary),
            buttonTheme:const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: Container(
            color: Colors.white,
            child: child,
          ),
        );
      },
    );
    return picked;
  }
}