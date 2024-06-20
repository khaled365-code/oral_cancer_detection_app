import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainer(conHeight:50.h,conWidth:50.w,conImage:ImageConstants.mouthLogo),
        SizedBox(height: 10.h,),
        Text(
          "OralGuard".tr(context),
          textAlign: TextAlign.center,
          style:AppTextStyles.font22.copyWith(
            color: AppColors.primary,
            fontFamily: 'lato',
          ),
        ),
      ],
    ) ;
  }
}
