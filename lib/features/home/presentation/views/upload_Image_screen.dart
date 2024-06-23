import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/default_app_bar.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/home/presentation/widgets/upload_image_body.dart';

import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/utilis/fontweight_helper.dart';

class UploadImageView extends StatelessWidget {
  const UploadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity,40.h),
          child:DefaultAppBar(
            titleISCenter: true,
            hasActions:false,
            hasTitle: true,
            hasLeading: true,
            backgroundColor: AppColors.primary,
            leading:Padding(
              padding:  EdgeInsetsDirectional.only(start: 5.w,top: 3.h),
              child: Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: AppColors.white,
                    ),
                  );
                }
              )
            ),
            title: Padding(
              padding:  EdgeInsetsDirectional.only(top: 3.h),
              child: ResuableText(
                text: 'OralGuard',
                color: AppColors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

          )),
      body: UploadImageBody(),
    );

  }
}
