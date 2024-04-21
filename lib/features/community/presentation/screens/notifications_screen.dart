

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commons/functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      floatingActionButton: GestureDetector(
        onTap: ()
        {
          navigate(context: context, route: Routes.addPostScreen);
        },
        child: Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
                color: AppColors.c4C9EEB,
                shape: BoxShape.circle
            ), child: Image.asset(ImageConstants.addTwitterTextImage)),
      ),
    );
  }
}
