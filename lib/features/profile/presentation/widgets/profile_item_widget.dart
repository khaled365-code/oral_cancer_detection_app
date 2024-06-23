

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_khaled_styles.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';
import 'package:graduation_project/features/profile/data/models/profile_data_model.dart';
import 'package:graduation_project/features/profile/presentation/widgets/update_profile_widget.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/commons/global_cubits/change_language_cubit/change_language_cubit.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_text_styles.dart';
import 'logout_bottom_sheet.dart';

class ProfileItemWidget extends StatefulWidget {
  const ProfileItemWidget({super.key, required this.profileDataModel,required this.currentIndex});

  final ProfileDataModel profileDataModel;
  final int currentIndex;

  @override
  State<ProfileItemWidget> createState() => _ProfileItemWidgetState();
}

class _ProfileItemWidgetState extends State<ProfileItemWidget> {

  late var  pressedLanguage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(bottom: 20.h),
      child: GestureDetector(
        onTap: () async
        {
          switch(widget.currentIndex)
          {
            case 0:
              showDialog(context: context, builder: (context) => UpdateProfileWidget(),);
            case 1:
             showDialog(context: context, builder: (context) =>
             Dialog(
               backgroundColor: AppColors.white,
               child: Padding(
                 padding:  EdgeInsetsDirectional.only(start: 10.w,end: 10.w,top: 5.h),
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Center(child: ResuableText(text: "language".tr(context),color: AppColors.primary,)),
                     TextButton(
                         onPressed: () {
                           pressedLanguage = 'en';
                           setState(() {

                           });

                           context
                               .read<ChangeLanguageCubit>()
                               .pressedLanguage = pressedLanguage;
                           context.read<ChangeLanguageCubit>()
                               .updateLanguage();
                           navigate(context: context,
                               route: Routes.loginScreen);
                         },
                         child: Text("english".tr(context),
                             style: AppTextStyles.font16.copyWith(color: AppColors.primary))),
                     LineWidget(
                       height: 1,
                       color: AppColors.primary,
                     ),
                     TextButton(
                         onPressed: () {
                           pressedLanguage = 'ar';
                           setState(() {

                           });
                           context
                               .read<ChangeLanguageCubit>()
                               .pressedLanguage = pressedLanguage;
                           context.read<ChangeLanguageCubit>()
                               .updateLanguage();
                           navigate(context: context,
                               route: Routes.loginScreen);
                         },
                         child: Text("arabic".tr(context),
                             style: AppTextStyles.font16.copyWith(color: AppColors.primary))),
                   ],
                 ),
               ),

             )
             );
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
              navigate(context: context, route: Routes.MRView);
            case 5:
            navigate(context: context, route: Routes.contactUsScreen);
            case 6:
              navigate(context: context, route: Routes.termsAndConditionsScreen);
            case 7:
              navigate(context: context, route: Routes.helpScreen);
            case 8:
              navigate(context: context, route: Routes.aboutApp);
            case 9:
              showModalBottomSheet(context: context, builder: (context) => LogoutBottomSheet(),);
          }

        },
        child: Column(
          children: [
            Container(
              child: Row(
                children:
                [
                  widget.profileDataModel.isSvg==true?SizedBox(
                    width:18.w,
                     height: 18.h,
                      child: SvgPicture.asset(widget.profileDataModel.image,color: AppColors.primary,)):
                  Image.asset(widget.profileDataModel.image,color: AppColors.primary,width: 20.w,height: 20.h,),
                  SizedBox(width: 10.w,),
                  Text(widget.profileDataModel.profileTitle.tr(context),style: AppKhaledStyles.textStyle(color: AppColors.black,size: 15,weight: FontWeight.normal),),
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
/*
() {
          showDialog(
          context: context,
          builder: (context) =>
          CupertinoAlertDialog(
          title: Text("language".tr(context),),
          content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextButton(
          onPressed: () {
          pressedLanguage = 'en';
          setState(() {

          });

          context
              .read<ChangeLanguageCubit>()
              .pressedLanguage = pressedLanguage;
          context.read<ChangeLanguageCubit>()
              .updateLanguage();
          navigate(context: context,
          route: Routes.loginScreen);
          },
          child: Text("english".tr(context),
          style: AppTextStyles.font16)),
          Divider(
          thickness: 2,
          indent: 1,
          endIndent: 1,
          color: AppColors.grey),
          TextButton(
          onPressed: () {
          pressedLanguage = 'ar';
          setState(() {

          });
          context
              .read<ChangeLanguageCubit>()
              .pressedLanguage = pressedLanguage;
          context.read<ChangeLanguageCubit>()
              .updateLanguage();
          navigate(context: context,
          route: Routes.loginScreen);
          },
          child: Text("arabic".tr(context),
          style: AppTextStyles.font16)),
          ],
          ),
          ));
          },

 */
