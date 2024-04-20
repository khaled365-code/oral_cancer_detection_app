import 'package:flutter/material.dart';

import '../utilis/app_text_styles.dart';
import '../utilis/colors.dart';

showSnackBar(BuildContext context,{required String content}){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content,style: AppTextStyles.font12,)
        ,backgroundColor: AppColors.white,
    behavior: SnackBarBehavior.floating,));
}