import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/profile/presentation/cubits/privacy_screen_cubit/privacy_screen_cubit.dart';
import 'package:graduation_project/features/profile/presentation/widgets/privacy_item_widget.dart';
import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/widgets/body_app_bar.dart';

class PrivacyPolicyScreen extends StatefulWidget {

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyScreenCubit, PrivacyScreenState>(
      builder: (context, state) {
        final privacyScreenCubit=BlocProvider.of<PrivacyScreenCubit>(context);
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 40.h, start: 15.w, end: 25.w),
                child: BodyAppBar(
                  hasLeading: true,
                  hasTitle: true,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.cEFF0F3,
                              width: 2.w
                          )
                      ),
                      child: Icon(Icons.arrow_back_outlined, size: 20.sp,),
                    ),
                  ),
                  title: Text(
                    'policy'.tr(context), style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight: FontWeight.bold,
                      size: 16),),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    padding: EdgeInsetsDirectional.only(
                        start: 15.w, end: 10.w, top: 20.h, bottom: 30.h),
                    itemBuilder: (context, index) =>
                        PrivacyItemWidget(
                          privacyModel: privacyScreenCubit.privacyDataList[index],
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 15.h,),
                    itemCount: privacyScreenCubit.privacyDataList.length),
              ),

            ],
          ),
        );
      },
    );
  }
}


