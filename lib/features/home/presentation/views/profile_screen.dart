

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/core/utilis/custom_app_bar.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../profile/data/profile_models/profile_data_model.dart';
import '../../../profile/presentation/components/drawer_body_item.dart';
import '../../../profile/presentation/components/language_drawer_item.dart';
import 'componants/profile_item_widget.dart';

class ProfileOutScreen extends StatelessWidget {
   ProfileOutScreen({super.key});


  final List<ProfileDataModel>profileDataList=
  [
    ProfileDataModel(profileTitle: 'Your Profile', image: ImageConstants.editprofile),
    ProfileDataModel(profileTitle: 'Language', image: ImageConstants.language),
    ProfileDataModel(profileTitle: 'Settings', image: ImageConstants.settings),
    ProfileDataModel(profileTitle: 'Help', image: ImageConstants.help),
    ProfileDataModel(profileTitle: 'About APP', image: ImageConstants.question),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 40.h),
        child: Padding(
          padding:  EdgeInsetsDirectional.only(start: 5.w),
          child: DefaultAppBar(
            leading: GestureDetector(
              onTap: ()
              {
                Navigator.pop(context);
              },
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.cEFF0F3,
                    width: 2.w
                  )
                ),
                child: Icon(Icons.arrow_back,size: 20.sp,),
              ),
            ),
            title: Text('Profie',style: AppKhaledStyles.textStyle(color: AppColors.black,weight: FontWeight.bold,size: 15.sp),),
            hasLeading: true,
            hasTitle: true,
            hasActions: false,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsetsDirectional.only(top: 10,start: 20.w,end: 20.w),
        child: CustomScrollView(
          slivers:
          [
           SliverToBoxAdapter(
             child:   Center(
               child: Stack(
                 clipBehavior: Clip.none,
                 children: [
                   Container(
                     width: 100.w,
                     height: 100.h,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                     ),
                     child: Image.asset(ImageConstants.manCommentImage,fit: BoxFit.fill,),
                   ),
                   PositionedDirectional(
                     bottom: -7.h,
                     end: -2.w,
                     child: Container(
                       width: 35.w,
                       height: 35.h,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: AppColors.c0165FC,
                           border: Border.all(
                               color: AppColors.white,
                               width: 2.w
                           )
                       ),
                       child: Image.asset(ImageConstants.pencilImage,color: AppColors.white,),
                     ),
                   )
                 ],
               ),
             ),
           ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'khaled'.tr(context),
                  style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight: FontWeight.bold,
                      size: 15.sp),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 3.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'khaledemail'.tr(context),
                  style: AppKhaledStyles.textStyle(
                      color: AppColors.grey,
                      weight: FontWeight.normal,
                      size: 15.sp),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 25.h,
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) => ProfileItemWidget(
                  profileDataModel: profileDataList[index],
                ),
                  childCount: 5
                )),
          ],

              ),
      ),
     );

  }
}

/*
 DrawerItem(
                text: "editprofile".tr(context),
                image: ImageConstants.editprofile,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.editProfilescreen);
                },
              ),
              SizedBox(height: 10.h,),
              LanguageDrawerItem(),
              SizedBox(height: 10.h,),
              DrawerItem(
                text: "settings".tr(context),
                image: ImageConstants.settings,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.settings);
                },
              ),
              SizedBox(height: 10.h,),
              DrawerItem(
                text: "location".tr(context),
                image: ImageConstants.location,
                onPressed: () {

                },
              ),
              SizedBox(height: 10.h,),
              DrawerItem(
                text: "help".tr(context),
                image: ImageConstants.question,
                onPressed: () {

                },
              ),
              SizedBox(height: 10.h,),
              DrawerItem(
                text: "about".tr(context),
                image: ImageConstants.help,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.aboutApp);
                },
              ),
              SizedBox(height: 10.h,),






 */
