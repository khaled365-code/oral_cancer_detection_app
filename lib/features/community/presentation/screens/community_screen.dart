



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/features/community/presentation/screens/no_posts_screen.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../widgets/post_container.dart';

class CommunityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    bool hasPosts=false;

    return Scaffold(

      body: Column(
        children: [
          Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => PostContainer(
                postHours: '3h',
                postOwner: 'Michael Daly',
                postOwnerPhoto: ImageConstants.manCommentImage,
                postText: 'Oral cancer symptoms can include persistent mouth sores, unusual lumps, or patches in the mouth or throat. Don\'t ignore any changes in your oral health—early detection is key! Regular dental check-ups and self-examinations are essential for spotting potential warning signs. #OralHealth #CancerAwareness',
              ),
            itemCount: 10,
          ),
          ),
        ],
      ),
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


    ) ;
  }
}

/*
SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsetsDirectional.only(bottom: 20.h),
          child: Column(
            children:
                [
                  Padding(
              padding:  EdgeInsetsDirectional.only(start: 10.w,end: 10.w,top: 10.h),
              child: Container(
                width: double.infinity,
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  TextButton(onPressed: () {}, child: Text('For You',style:AppTextStyles.font16.copyWith())),
                  SizedBox(
                    width: 70.w,
                  ),
                  TextButton(onPressed: () {}, child: Text('Lastest',style:AppTextStyles.font16.copyWith())),
                  SizedBox(
                    width: 70.w,
                  ),
                  TextButton(onPressed: () {}, child: Text('New!',style:AppTextStyles.font16.copyWith())),
                ]),
              ),
            ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 20.w,end: 10.w),
                    child: PostContainer(
                      postHours: '3h',
                      postOwner: 'Michael Daly',
                      postOwnerPhoto: ImageConstants.profilePic,
                      postText: 'Oral cancer symptoms can include persistent mouth sores, unusual lumps, or patches in the mouth or throat. Don\'t ignore any changes in your oral health—early detection is key! Regular dental check-ups and self-examinations are essential for spotting potential warning signs. #OralHealth #CancerAwareness',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 20.w,end: 10.w),
                    child: PostContainer(
                      postHours: '3h',
                      postOwner: 'Michael Daly',
                      postOwnerPhoto: ImageConstants.profilePic,
                      postText: 'Oral cancer symptoms can include persistent mouth sores, unusual lumps, or patches in the mouth or throat. Don\'t ignore any changes in your oral health—early detection is key! Regular dental check-ups and self-examinations are essential for spotting potential warning signs. #OralHealth #CancerAwareness',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),Divider(
                  thickness: 1,
                  color: AppColors.grgr,
                ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 20.w,end: 10.w),
                    child: PostContainer(
                      postHours: '3h',
                      postOwner: 'Michael Daly',
                      postOwnerPhoto: ImageConstants.profilePic,
                      postText: 'Oral cancer symptoms can include persistent mouth sores, unusual lumps, or patches in the mouth or throat. Don\'t ignore any changes in your oral health—early detection is key! Regular dental check-ups and self-examinations are essential for spotting potential warning signs. #OralHealth #CancerAwareness',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),


                ]

              ),
        ),
      )



 */


