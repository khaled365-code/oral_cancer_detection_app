
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class PrivacyContainerItem extends StatelessWidget {

  final String text;
  final void Function() onTap;
  final bool isPressed;
  final String answerText;
  const PrivacyContainerItem({
    super.key, required this.text, required this.onTap, required this.isPressed, required this.answerText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color:  AppColors.str.withOpacity(.2),
            border: Border.all(
              color:  AppColors.str.withOpacity(.5),
            )
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 5.w,),
                Text(text,style: AppTextStyles.font14.copyWith(fontWeight: FontWeight.normal),),
                Spacer(),
                IconButton(onPressed: onTap, icon: Icon(Icons.keyboard_arrow_down_sharp,color: AppColors.red,size: 30,)),
              ],
            ),
            isPressed? Container(
                decoration: BoxDecoration(
                    color:  AppColors.white,
                    border: Border.all(
                      color:  AppColors.str.withOpacity(.5),
                    )
              ),
              child: Padding(
                padding:EdgeInsetsDirectional.only(top: 20.h,start: 10.w,
                   end: 40.w,bottom: 20.h),
                child: Text(answerText,style: AppTextStyles.font14.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),),
              ),
            ): SizedBox(width: 2.w,),

          ],
        ),
      ),
    );
  }
}