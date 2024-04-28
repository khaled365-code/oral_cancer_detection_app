import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/auth/data/manager/log_out_cubit.dart';
import 'package:graduation_project/features/auth/data/manager/log_out_state.dart';
import 'drawer_body_item.dart';

class LogOutDrawerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogOutCubit,LogOutState>(
      listener: (context, state) {
        if(state is LogOutFailure){
          showSnackBar(context, content: state.errorMessage);
        }
       else if(state is LogOutSuccess)  {
          showSnackBar(context, content: state.message);
           exit(0);
        }
      },
      builder: (context, state) {
        return DrawerItem(
          text: "logout".tr(context),
          image: ImageConstants.logout,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) =>
                    CupertinoAlertDialog(
                      title: Text("logout".tr(context),),
                      content: Column(
                        children: [
                          SizedBox(height: 10.h,),
                          Text("logoutsure".tr(context),
                            style: AppTextStyles.font14.copyWith(
                                color: AppColors.black),),
                          SizedBox(height: 5.h,),
                          Divider(
                              thickness: 2,
                              color: Colors.grey[400]),
                          Row(
                            children: [
                              TextButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: Text(
                                  "cancel".tr(context),
                                  style: AppTextStyles.font16.copyWith(
                                      color: AppColors.primary))),
                              Spacer(),
                             state is LogOutLoading? Center(child: CircularProgressIndicator()):
                             TextButton(onPressed: () {
                                 context.read<LogOutCubit>().LogOut();
                              }, child: Text("logout".tr(context),
                                  style: AppTextStyles.font16.copyWith(
                                      color: AppColors.primary))),
                            ],
                          )

                        ],
                      ),
                    ));
          },
        );
      },
    );
  }
}