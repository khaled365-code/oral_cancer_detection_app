


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/community/data/models/camera_posts_model.dart';

import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';

class CmaeraPostContainer extends StatelessWidget {

  final CameraPostsModedl cameraPostsModedl;
  const CmaeraPostContainer({
    super.key,required this.cameraPostsModedl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78.w,
      height: 78.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.cCED5DC,
            width: 1.w
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: cameraPostsModedl.isFixed==false? Center(child: Image.asset(ImageConstants.cameraBlueImage),):Image.asset(cameraPostsModedl.image,fit: BoxFit.cover,),
    );
  }
}