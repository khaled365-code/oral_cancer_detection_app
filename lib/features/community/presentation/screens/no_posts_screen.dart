


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';

class NoPostsScreen extends StatelessWidget {
  const NoPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        leading: Padding(
           padding: EdgeInsetsDirectional.only(start: 20.w),
            child: Image.asset(ImageConstants.roundPostTwitter)),
      ),
    );
  }
}
