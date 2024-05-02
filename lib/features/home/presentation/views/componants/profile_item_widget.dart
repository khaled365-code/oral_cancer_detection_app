

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';
import 'package:graduation_project/features/profile/data/profile_models/profile_data_model.dart';

import '../../../../../core/utilis/colors.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({super.key, required this.profileDataModel});

  final ProfileDataModel profileDataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(bottom: 30.h),
      child: Column(
        children: [
          Container(
            child: Row(
              children:
              [
                Image.asset(profileDataModel.image,color: AppColors.primary,),
                SizedBox(width: 10.w,),
                Text(profileDataModel.profileTitle.tr(context),style: AppKhaledStyles.textStyle(color: AppColors.black,size: 15),),
                Spacer(),
                Center(child: Icon(Icons.arrow_forward_ios_rounded,color: AppColors.primary,size: 20,)),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          LineWidget(),
        ],
      ),
    );
  }
}
