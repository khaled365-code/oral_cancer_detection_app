import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/features/community/data/models/search_model/data_serach.dart';
import 'package:graduation_project/features/community/presentation/widgets/serach_post_result_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/commons/functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/custom_app_bar.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/widgets/resuable_text.dart';
import '../widgets/line_widget.dart';
import '../widgets/no_search_result_widget.dart';

class SearchPostsScreen extends StatelessWidget {
  const SearchPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
      listener: (context, state) {
        if(state is SearchForPostsSuccessState)
        {
          showToast(msg: 'Matching Data Successfully Loaded',toastStates: ToastStates.success);
        }
        else if(state is SearchForPostsFailureState )
        {
          showToast(msg: state.errorMessage,toastStates: ToastStates.error);

        }
      },
      builder: (context, state) {
        final communityBloc = BlocProvider.of<GlobalCommunityBloc>(context);
        return Scaffold(
          body: state is SearchForPostsLoadingState ?
          SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 40.h,
                    child: Row(
                      children:
                      [
                        SizedBox(width: 15.w,),
                        GestureDetector(
                            onTap: () {
                              communityBloc.getAllPostsFun();
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.c4C9EEB,
                              size: 15.sp,
                            )),
                        SizedBox(width: 16.w,),
                        Container(
                          height: 32.h,
                          width: 270.w,
                          decoration: BoxDecoration(
                              color: AppColors.cE7ECF0,
                              borderRadius: BorderRadius.circular(25.r)
                          ),
                          child: Expanded(
                            child: TextField(
                              controller: communityBloc.searchFieldController,
                              onSubmitted: (value) async
                              {
                                await communityBloc.searchForPosts(
                                    searchContent: value);
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsetsDirectional.only(
                                    start: 20.w, bottom: 10.h,),
                                  hintText: 'Search Posts',
                                  hintStyle: AppKhaledStyles.textStyle(
                                    color: AppColors.cAFB8C1,
                                    size: 13,
                                  )
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 16.w),
                          child: GestureDetector(
                              onTap: () {
                                // navigate(context: context, route: Routes.noPostsScreen);
                              },
                              child: Image.asset(
                                  ImageConstants.communitySettingsImage)),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 6.h,),
                  LineWidget(),
                  Shimmer.fromColors(
                    baseColor: AppColors.cE1E1E1,
                    highlightColor: AppColors.primary,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.w, top: 10.h),
                      child: ResuableText(
                        text: 'Posts for you',
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
            
                      ),
                    ),
                  ),
                  SizedBox(height: 12.3.h,),
                  LineWidget(),
                  Shimmer.fromColors(
                      baseColor: AppColors.cE1E1E1,
                      highlightColor: AppColors.primary,
                      child: NoSearchResultWidget()),
                  Shimmer.fromColors(
                    baseColor: AppColors.cE1E1E1,
                    highlightColor: AppColors.primary,
                    child: Expanded(
                        child: Container(
                          color: AppColors.cE7ECF0,
                        )),
                  )

                ]
            ),
          ):
          state is SearchForPostsSuccessState ?
          SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40.h,
                  child: Row(
                    children:
                    [
                      SizedBox(width: 15.w,),
                      GestureDetector(
                          onTap: () {
                            communityBloc.getAllPostsFun();
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.c4C9EEB,
                            size: 15.sp,
                          )),
                      SizedBox(width: 16.w,),
                      Container(
                        height: 32.h,
                        width: 270.w,
                        decoration: BoxDecoration(
                            color: AppColors.cE7ECF0,
                            borderRadius: BorderRadius.circular(25.r)
                        ),
                        child: Expanded(
                          child: TextField(
                            controller: communityBloc.searchFieldController,
                            onSubmitted: (value) async
                            {
                              await communityBloc.searchForPosts(
                                  searchContent: value);
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.only(
                                  start: 20.w, bottom: 10.h,),
                                hintText: 'Search Posts',
                                hintStyle: AppKhaledStyles.textStyle(
                                  color: AppColors.cAFB8C1,
                                  size: 13,
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 16.w),
                        child: GestureDetector(
                            onTap: () {
                              // navigate(context: context, route: Routes.noPostsScreen);
                            },
                            child: Image.asset(
                                ImageConstants.communitySettingsImage)),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 6.h,),
                Expanded(
                child: ListView.builder(
                 itemBuilder: (context, index) =>
                 SearchResultWidget(
                serachModel: state.searchModel.data![index]),
                itemCount: state.searchModel.data!.length,
                        )),
              ],
            ),
          ) :
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 40.h,
                  child: Row(
                    children:
                    [
                      SizedBox(width: 15.w,),
                      GestureDetector(
                          onTap: () {
                            communityBloc.getAllPostsFun();
                            Navigator.pop(context);
                            },
                          child: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: AppColors.c4C9EEB,
                                        size: 15.sp,
                                      )),
                      SizedBox(width: 16.w,),
                      Container(
                        height: 32.h,
                        width: 270.w,
                        decoration: BoxDecoration(
                            color: AppColors.cE7ECF0,
                            borderRadius: BorderRadius.circular(25.r)
                        ),
                        child: Expanded(
                          child: TextField(
                            controller: communityBloc.searchFieldController,
                            onSubmitted: (value) async
                            {
                              await communityBloc.searchForPosts(
                                  searchContent: value);
                            },
                            cursorHeight: 18.h,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.only(
                                  start: 20.w, bottom: 10.h,),
                                hintText: 'Search Posts',
                                hintStyle: AppKhaledStyles.textStyle(
                                  color: AppColors.cAFB8C1,
                                  size: 13,
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 16.w),
                        child: GestureDetector(
                            onTap: () {
                              // navigate(context: context, route: Routes.noPostsScreen);
                            },
                            child: Image.asset(
                                ImageConstants.communitySettingsImage)),
                      ),
            
                    ],
                  ),
                ),
                SizedBox(height: 6.h,),
                LineWidget(),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.w, top: 10.h),
                  child: ResuableText(
                    text: 'Posts for you',
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
            
                  ),
                ),
                SizedBox(height: 12.3.h,),
                LineWidget(),
                NoSearchResultWidget(),
                Expanded(
                    child: Container(
                      color: AppColors.cE7ECF0,
                    ))
            
            
              ]
                    ),
          ),





          floatingActionButton: GestureDetector(
            onTap: () async {

             await communityBloc.searchForPosts(searchContent: communityBloc.searchFieldController.text);
            },
            child: Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle
                ), child: Icon(FontAwesomeIcons.magnifyingGlass,color: AppColors.white,)),
          ),
        );
      },
    );
  }
}
