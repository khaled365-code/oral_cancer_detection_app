
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/resuable_text.dart';


class AboutAppContainerItem extends StatelessWidget {


  final String text;
  final void Function() onTap;
  const AboutAppContainerItem({
    super.key, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        child: Row(
          children: [
            ResuableText(text: text,fontSize: 16,fontWeight: FontWeight.normal,),
            Spacer(),
            Icon(Icons.navigate_next,color: AppColors.primary,size: 30,),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    );
  }
}