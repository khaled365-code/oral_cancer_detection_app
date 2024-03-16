


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';
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
        child: Image.asset(AppAssets.homelines, color: AppColors.primary),
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
          padding: const EdgeInsets.only(right: 25),
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AppAssets.profilePic),
            ),
          ),
        ),
      ],
    );
    }
}
