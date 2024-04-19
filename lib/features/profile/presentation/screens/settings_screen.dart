import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/features/profile/presentation/manager/change_language_cubit.dart';
import 'package:graduation_project/features/profile/presentation/manager/change_theme_cubit.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../components/notification_container.dart';

class SettingsScreen extends StatefulWidget {

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    bool noteSwitch = true;
    bool updateSwitch = true;
    String country = 'EGY';

    return BlocConsumer<ChangeThemeCubit, ChangeThemeState>(
      listener: (context, state) {
      if(state is ChangeThemeSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)));
      }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 50.h),
            child: CustomAppBar(
              title: S
                  .of(context)
                  .settings,
            ),
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 24.w, top: 33.h, end: 28.w),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('settings', style: AppTextStyles.font20.copyWith(
                      color: AppColors.primary),),
                  SizedBox(height: 25.h,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImageConstants.account,
                              color: AppColors.primary,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'data',
                              style: AppTextStyles.font16.copyWith(
                                  color: AppColors.primary),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(S
                            .of(context)
                            .editprofile,
                            style: AppTextStyles.font16
                                .copyWith(color: AppColors.black)),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          'Change Password',
                          style:
                          AppTextStyles.font16.copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35.h,),
                  Row(
                    children: [
                      Image.asset(
                        ImageConstants.notification,
                        color: AppColors.primary,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Notifications',
                        style: AppTextStyles.font16.copyWith(color: AppColors
                            .primary),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(children:
                  [
                    Text('Notification', style: AppTextStyles.font16.copyWith(
                        color: AppColors.black),),
                    Spacer(),
                    Switch(
                      activeColor: AppColors.primary,
                      value: noteSwitch, onChanged: (value) {
                      setState(() {
                        noteSwitch = value;
                      });
                    },),
                  ]),
                  SizedBox(height: 19.h,),
                  Row(children:
                  [
                    Text('Updates', style: AppTextStyles.font16.copyWith(
                        color: AppColors.black),),
                    Spacer(),
                    Switch(
                      activeColor: AppColors.primary,
                      value: updateSwitch, onChanged: (value) {
                      setState(() {
                        updateSwitch = value;
                      });
                    },),
                  ]),
                  SizedBox(height: 50.h,),
                  Row(
                    children: [
                      Image.asset(
                        ImageConstants.settings,
                        color: AppColors.primary,
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Text(
                        'Other',
                        style: AppTextStyles.font16.copyWith(color: AppColors
                            .primary),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h,),
                  Row(children:
                  [
                    Text('Dark Mode', style: AppTextStyles.font16.copyWith(
                        color: AppColors.black),),
                    Spacer(),
                    Switch(
                      activeColor: AppColors.primary,
                      value: context
                          .read<ChangeThemeCubit>()
                          .isDarkMode,
                      onChanged: (value) {
                        context.read<ChangeThemeCubit>().changeTheme(value);

                      },),
                  ]),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Text('Region', style: AppTextStyles.font16.copyWith(
                          color: AppColors.black),),
                      Spacer(),
                      Container(
                        width: 80.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.settings,
                          border: Border.all(
                            color: AppColors.grgr,
                          ),
                        ),
                        child: DropdownButton(
                          items: ['EGY', 'SAU', 'KWT', 'USA', 'AUS', 'QAT'].
                          map((e) =>
                              DropdownMenuItem(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text('$e'),
                                ),
                                value: e,
                              )).toList(),
                          onChanged: (value) {
                            setState(() {
                              country = value!;
                            });
                          },
                          value: country,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}






