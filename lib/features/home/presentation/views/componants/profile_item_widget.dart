

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';
import 'package:graduation_project/features/profile/data/profile_models/profile_data_model.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/colors.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({super.key, required this.profileDataModel,required this.currentIndex});

  final ProfileDataModel profileDataModel;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(bottom: 20.h),
      child: GestureDetector(
        onTap: () async
        {
          switch(currentIndex)
          {
            case 0:
              navigate(context: context, route: Routes.editProfilescreen);
            case 1:
              navigate(context: context, route: Routes.editProfilescreen);
              case 2:
            navigate(context: context, route: Routes.settings);
            case 3:
              try {
                final String message='Spread the word about our medical diagnosis app!\n                com.example.graduation_project';
                await Share.share(message);
                print(
                    'Thank you for sharing my website!');
              } catch (e)
              {
                print('Error sharing: $e');
              }
            case 4:
            case 5:
            case 6:
            case 7:
              navigate(context: context, route: Routes.aboutApp);
            case 8:
              navigate(context: context, route: Routes.faqscreen);
            case 9:
          }

        },
        child: Column(
          children: [
            Container(
              child: Row(
                children:
                [
                  profileDataModel.isSvg==true?SizedBox(
                    width:18.w,
                     height: 18.h,
                      child: SvgPicture.asset(profileDataModel.image,color: AppColors.primary,)):
                  Image.asset(profileDataModel.image,color: AppColors.primary,width: 20.w,height: 20.h,),
                  SizedBox(width: 10.w,),
                  Text(profileDataModel.profileTitle.tr(context),style: AppKhaledStyles.textStyle(color: AppColors.black,size: 15,weight: FontWeight.normal),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded,color: AppColors.primary,size: 17.sp,),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
            LineWidget(),
          ],
        ),
      ),
    );
  }
}
