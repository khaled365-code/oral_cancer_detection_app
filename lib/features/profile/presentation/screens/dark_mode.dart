import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/global_cubits/change_theme_cubit/change_theme_cubit.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_khaled_styles.dart';
import 'package:graduation_project/core/widgets/body_app_bar.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';
import 'package:graduation_project/features/profile/presentation/widgets/dark_mode_item_widget.dart';

class DarkModeScreen extends StatelessWidget {
  const DarkModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeThemeCubit, ChangeThemeState>(
      listener: (context, state)
      {
        // TODO: implement listener
      },
      builder: (context, state) {
        final changeThemeCubit = BlocProvider.of<ChangeThemeCubit>(context);
        return Scaffold(
          body: Column(
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
                  title: Text('Dark mode', style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight: FontWeight.bold,
                      size: 16)),
                ),
              ),
              SizedBox(height: 10.h,),
              LineWidget(
                height: 1.5,
                color: AppColors.cEBEBEB,
              ),
              Expanded(
                child: ListView.separated(
                    padding:  EdgeInsetsDirectional.only(start: 15.w,end: 15.w,top: 10.h),
                    itemBuilder: (context, index) =>
                        DarkModeItemWidget(
                         currentIndex: index,
                          darkModeDataList: changeThemeCubit.darkModeDataList,
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                    itemCount:  changeThemeCubit.darkModeDataList.length),
              )


            ],
          ),
        );
      },
    );
  }
}
