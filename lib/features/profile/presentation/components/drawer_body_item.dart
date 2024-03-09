



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.text, required this.image, required this.onPressed});

  final String text;
  final String image;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
          [
            Image.asset(image,color: AppColors.black,width: 65,height: 65,),
            SizedBox(width: 10,),
            TextButton(onPressed: onPressed,child:Text(text,style: AppTextStyles.font16.copyWith(color: Colors.black),)),

          ],
        ));
  }
}
