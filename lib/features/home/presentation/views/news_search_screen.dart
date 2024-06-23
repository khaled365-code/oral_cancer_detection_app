import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_outlined_textfield.dart';
import 'package:graduation_project/features/home/presentation/manager/search_news_cubit/search_news_cubit.dart';
import '../../../../core/utilis/app_colors.dart';
import '../widgets/news_search_body.dart';

class NewsSearchScreen extends StatelessWidget {
  const NewsSearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchNewsCubit>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primary,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 10.h),

            child: Center(
              child: CustomOutlinedTextField(
                textStyle: AppTextStyles.font14.copyWith(color: AppColors.white),
                focusedBorderSideColor: AppColors.white,
                hintText: 'Search for Medical News...',
                  onFieldSubmitte: (data) {
                    searchCubit.onSubmittedSearch(data);
                  },
                 enabledBorderSideColor: AppColors.white,
                  hasSuffixIcon: true,
                  suffixIcon: Icons.search,
                  controller: searchCubit.searchController,
                  keyboardType: TextInputType.text
              ),
            ),
          ),
        ),
      ),
      body:NewsSearchBody()

    );
  }
}
