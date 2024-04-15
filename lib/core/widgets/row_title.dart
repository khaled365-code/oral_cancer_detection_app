import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/generated/l10n.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          CustomContainer(conHeight:43.h,conWidth:56.w,conImage:AppAssets.plus),
        Text(
          S.of(context).staySafe,
          textAlign: TextAlign.center,
          style:AppTextStyles.font22.copyWith(
              color: AppColors.primary,
              fontFamily: 'lato',
          ),
        ),
      ],
    );
  }
}
