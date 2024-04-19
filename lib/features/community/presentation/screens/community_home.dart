



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/colors.dart';

import '../../../../core/utilis/image_constants.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../components/post_container.dart';

class CommunityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // appBar: PreferredSize(
      //   preferredSize: Size(double.infinity, 50),
      //   child: Builder(
      //     builder: (BuildContext context) {
      //       return AppBar(
      //         automaticallyImplyLeading: false,
      //         leading: Padding(
      //           padding: const EdgeInsets.only(left: 20),
      //           child: InkWell(
      //             onTap: () {
      //               Scaffold.of(context).openDrawer();
      //             },
      //             child:CircleAvatar(
      //               radius: 20,
      //               backgroundImage: AssetImage(AppAssets.profilePic),
      //             ),
      //           ),
      //         ),
      //         title: Text('Welcome!',style: AppTextStyles.font16.copyWith()),
      //         centerTitle: true,
      //       );
      //     },
      //   ),
      // ),
      body: SingleChildScrollView(
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
      ),



    );
  }
}


