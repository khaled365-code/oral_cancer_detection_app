import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class BottomNavColumn extends StatelessWidget {
  const BottomNavColumn({super.key,this.paddingValue,required this.icon,required this.text});
   final double? paddingValue;
   final String text;
   final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(paddingValue??0),
      child: Column(children: [
        Icon(icon ),
        Text(text,style: AppTextStyles.font12,)

      ],),
    );
  }
}
