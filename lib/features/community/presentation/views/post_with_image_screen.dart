

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/default_app_bar.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';

import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/utilis/image_constants.dart';
import '../widgets/line_widget.dart';
import '../widgets/post_with_image_container.dart';

class PostWithImageScreen extends StatelessWidget {
  const PostWithImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(double.infinity, 40.h),
        child: DefaultAppBar(
          leading: Padding(
               padding:  EdgeInsetsDirectional.only(start: 18.5.w),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios_outlined,color: AppColors.c57A4EC,)),
            ),
          title: ResuableText(
            text: 'Post',
           color: AppColors.black,
           fontWeight: FontWeight.bold,
           fontSize: 14,),
          hasActions: false,
          hasTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 19.w),
            child: Column(
              children: [
                LineWidget(),
                Padding(
                  padding:  EdgeInsets.only(top: 20.h),
                  child: PostWithImageContainer(),
                ),
                Spacer(),
                Padding(
                  padding:  EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    children: [
                      Image.asset(ImageConstants.roundPostTwitter),
                      SizedBox(width: 8.w,),
                      Expanded(
                        child: Container(
                          width: 331.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.cE7ECF0,
                              borderRadius: BorderRadius.circular(25.r)
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.only(start:12.w),
                                hintText: 'Write your reply',
                                hintStyle: AppKhaledStyles.textStyle(
                                  color: AppColors.c687684,
                                  size: 15,
                                  weight: FontWeight.w400,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),


                    ],
                  ),
                ),

        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
