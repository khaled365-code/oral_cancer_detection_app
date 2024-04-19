


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilis/colors.dart';
import '../utilis/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {

  final String title;


  const CustomAppBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.white,
        systemOverlayStyle:const SystemUiOverlayStyle(
            statusBarColor: AppColors.white
        ),
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios_new,size: 20,color: AppColors.black,),onPressed: (){Navigator.pop(context);}),
        title: Text(title,style: AppTextStyles.font20.copyWith(color: AppColors.black),),
        centerTitle: true);
  }
}