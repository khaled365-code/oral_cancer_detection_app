import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:graduation_project/features/profile/presentation/manager/logout_cubit/logout_from_settings_cubit.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/widgets/resuable_text.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../community/presentation/widgets/line_widget.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LogoutFromSettingsCubit(
              profileRepoImplementation: ProfileRepoImplementation(
                  api: DioConsumer(dio: Dio(), isModel: false, ))),
      child: BlocConsumer<LogoutFromSettingsCubit, LogoutFromSettingsState>(
        listener: (context, state)
        {
          if(state is LogoutFromSettingsSuccessState )
            {
              exit(0);
            }
          if(state is LogoutFromSettingsFailureState )
          {
            showToast(msg: state.errorMessage, toastStates: ToastStates.error);
          }
        },
        builder: (context, state) {
          final logoutCubit = BlocProvider.of<LogoutFromSettingsCubit>(context);
          return Container(
              height: 200.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  )
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: 15.h, start: 140.w, end: 140.w),
                      child: Center(
                        child: LineWidget(
                          color: AppColors.cE6E6E6.withOpacity(.3),
                          height: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 25.h),
                      child: ResuableText(text: 'Sign out',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: 15.h, start: 30.w, end: 30.w),
                      child: Center(
                        child: LineWidget(
                          color: AppColors.cE7E7E7,
                          height: 2,
                        ),
                      ),
                    ),
                    Spacer(),
                    ResuableText(text: 'Are You Sure You Want to Log out?',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: AppColors.grey,),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 20.h,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          SharedButton(btnText: 'Cancel',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            hasBorderRadius: true,
                            borderRadiusValue: 25.r,
                            hasBorder: true,
                            height: 50,
                            buttonColor: AppColors.white,
                            btnTextStyle: AppKhaledStyles.textStyle(
                                color: AppColors.primary,
                                size: 18
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          SharedButton(btnText: 'Yes, Sign out',
                            onPressed: ()
                            {
                              logoutCubit.logout();

                            },
                            hasBorderRadius: true,
                            borderRadiusValue: 25.r,
                            height: 50,
                            btnTextStyle: AppKhaledStyles.textStyle(
                                color: AppColors.white,
                                size: 18

                            ),

                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                  ])
          );
        },
      ),
    );
  }
}
