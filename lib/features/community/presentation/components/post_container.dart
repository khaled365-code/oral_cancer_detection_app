



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';

class PostContainer extends StatelessWidget {
  final String postOwner;
  final String postText;
  final String postHours;
  final String postOwnerPhoto;

  const PostContainer({
    super.key, required this.postOwner, required this.postText, required this.postHours, required this.postOwnerPhoto,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Container(
          height: 210.h,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage: AssetImage(postOwnerPhoto),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                postOwner,
                                style: AppTextStyles.font16,
                              ),
                              Spacer(),
                              Text(postHours),
                              SizedBox(width: 10.w),
                              Icon(Icons.linear_scale),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Expanded(
                            child: Text(
                              postText,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.font16,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.comment_sharp),
                              SizedBox(width: 100.w,),
                              Icon(Icons.favorite),
                              SizedBox(width: 100.w,),
                              Icon(Icons.share),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ],
    );
  }
}
