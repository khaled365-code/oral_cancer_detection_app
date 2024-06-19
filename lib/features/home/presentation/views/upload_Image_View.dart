import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/default_app_bar.dart';
import 'package:graduation_project/features/home/presentation/widgets/upload_image_body.dart';

class UploadImageView extends StatelessWidget {
  const UploadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(double.infinity, 40.h),
          child:DefaultAppBar(hasActions:false,hasTitle: false,hasLeading: false,backgroundColor: AppColors.primary,)),
      body: UploadImageBody(),
    );

  }
}
