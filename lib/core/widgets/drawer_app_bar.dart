


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../utilis/image_constants.dart';
import '../utilis/colors.dart';
import '../utilis/app_text_styles.dart';

class DrawerAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Image.asset(ImageConstants.homelines, color: AppColors.primary),
      ),
      title: Column(
        children: [
          Text(
            S.of(context).hi,
            style: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal),
          ),
          Text(
            S
                .of(context)
                .khaled + ' !',
            style: AppTextStyles.font16.copyWith(),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding:  EdgeInsetsDirectional.only(end: 25.w),
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(ImageConstants.profilePic),
            ),
          ),
        ),
      ],
    );
    }
}
