


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/colors.dart';
import '../../data/profile_models/settings_data_model.dart';
import 'delete_account_widget.dart';

class SettingsItemWidget extends StatelessWidget {
  const SettingsItemWidget({super.key, required this.settingsDataModel, required this.currentIndex,});

  final SettingsDataModel settingsDataModel;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        switch(currentIndex)
        {
          case 0:
            navigate(context: context, route: Routes.putNewPassword);
          case 1:
            showModalBottomSheet(
                context: context, builder: (context) => DeleteAccountwidget());
        }
      },
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Icon(settingsDataModel.iconForm,color: AppColors.primary,),
                SizedBox(width: 10.w,),
                ResuableText(text: settingsDataModel.settingName),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded,color: AppColors.primary,size: 17.sp,),

              ],
            ),
            SizedBox(height: 20.w,),
            LineWidget(),
          ],
        ),
      ),
    );
  }
}
