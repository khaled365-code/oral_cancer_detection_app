import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/cubits/change_retweet_shape_cubit/change_retweet_shape_cubit.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/Data.dart';

import '../../../../core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';

class RetweetBottomSheet extends StatelessWidget {
  const RetweetBottomSheet(
      {super.key, required this.data, this.newAllPostsDataList, this.currentIndex,});


  final NewAllPostsData data;

  final List<NewAllPostsData>? newAllPostsDataList;
  final int? currentIndex;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeRetweetCubit, ChangeRetweetState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
          listener: (context, state) {
            if (state is AddPostSuccessState) {
              showToast(msg: 'Post Reposted Successfully',toastStates: ToastStates.success);
            }
            if (state is AddPostFailureState) {
              showToast(
                  msg: state.errorMessage, toastStates: ToastStates.error);
            }
          },
          builder: (context, state) {
            final communityBloc = BlocProvider.of<GlobalCommunityBloc>(context);
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 235.h,
              color: AppColors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 24.w, top: 38.h),
                    child: GestureDetector(
                      onTap: () async
                      {
                        await communityBloc.addNewPost(body: data.post!.body);
                        communityBloc.getAllPostsFun();
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(ImageConstants.retweetImage),
                          SizedBox(width: 20.w,),
                          ResuableText(
                            text: 'Repost',
                            color: AppColors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 24.w, top: 40.h),
                    child: Row(
                      children: [
                        Image.asset(ImageConstants.penCommunityImage),
                        SizedBox(width: 20.w,),
                        ResuableText(
                          text: 'Report Offensive Content',
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 42.h, start: 8.w, end: 8.w),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<ChangeRetweetCubit>(context).changeRetweetShape();
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .9,
                        height: 48.h,
                        decoration: BoxDecoration(
                            color: AppColors.cE7ECF0,
                            borderRadius: BorderRadius.circular(25.r)
                        ),
                        child: Center(
                          child: ResuableText(
                            text: 'Cancel',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }
}
