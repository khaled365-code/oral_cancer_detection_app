import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/profile/presentation/manager/help_screen_cubit/help_screen_cubit.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../components/help_item_widget.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpScreenCubit, HelpScreenState>(
      builder: (context, state) {
        final helpScreenCubit=BlocProvider.of<HelpScreenCubit>(context);
        return Scaffold(
          backgroundColor: AppColors.white,

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
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
                  title: Text('Help Center', style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight: FontWeight.bold,
                      size: 16),),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    padding: EdgeInsetsDirectional.only(
                        start: 20.w, end: 20.w, top: 30.h,bottom: 30.h),
                    itemBuilder: (context, index) => HelpItemWidget(
                      helpModel: helpScreenCubit.helpDataList[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                    itemCount: helpScreenCubit.helpDataList.length),
              )


            ],

          ),
        );
      },
    );
  }
}
