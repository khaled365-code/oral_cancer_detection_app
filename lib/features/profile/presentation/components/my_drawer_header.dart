
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../generated/l10n.dart';

class MyDrawerHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding:EdgeInsetsDirectional.only(top: 60.h),
        child: Column(
          children: [
            Container(
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: AssetImage(AppAssets.profilePic),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              S.of(context).khaled,
              style: AppTextStyles.font20,
            ),
            Text(
              S.of(context).khaledemail,
              style: AppTextStyles.font14.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
