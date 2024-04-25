import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/profile/presentation/components/language_drawer_item.dart';
import 'package:graduation_project/features/profile/presentation/components/log_ou_drower_item.dart';
import '../../../../core/routes/routes.dart';
import 'drawer_body_item.dart';


class MyDrawerBody extends StatefulWidget {
  @override
  State<MyDrawerBody> createState() => _MyDrawerBodyState();
}

class _MyDrawerBodyState extends State<MyDrawerBody> {

  @override
  Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w, top: 10.h),
            child: Column(
              children: [
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
                  text:"help".tr(context),
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
                LogOutDrawerItem(),
              ],
            )
        );
      }
  }





