import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/widgets/custom_outlined_textfield.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/data/repos/community_repo_implementation.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';
import '../widgets/camera_post_container.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
      listener: (context, state) {
        if(state is AddPostSuccessState)
          {
            showToast(msg: state.successMessage,toastStates: ToastStates.success);
          }
        else if(state is AddPostFailureState )
          {
            showToast(msg: state.errorMessage,toastStates: ToastStates.error);

          }
      },
      builder: (context, state)
      {
        final communityBloc = BlocProvider.of<GlobalCommunityBloc>(context);
       return Scaffold(
                body: Column(
                    children: [

                      SizedBox(height: 50.h,),
                      state is AddPostLoadingState ?
                      Shimmer.fromColors(
                      baseColor: AppColors.cE1E1E1,
                      highlightColor: AppColors.primary,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.h,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 20.w),
                              child: TextButton(
                                onPressed: () {},
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: AppKhaledStyles.textStyle(
                                      color: AppColors.c4C9EEB,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            state is AddPostLoadingState
                                ? SizedBox(
                                    width: 10.w,
                                    height: 10.w,
                                    child: CircularProgressIndicator(
                                      color: AppColors.primary,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      communityBloc.addNewPost(
                                          body:
                                              communityBloc.bodyController.text,
                                          title: communityBloc
                                              .postTitleController.text);
                                    },
                                    child: Container(
                                      width: 67.w,
                                      height: 34.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.cB9DCF7,
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Post',
                                          style: AppKhaledStyles.textStyle(
                                            color: AppColors.white,
                                            size: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              width: 21.w,
                            ),
                          ],
                        ),
                      ),
                    )
                      :Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40.h,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 20.w),
                            child: TextButton(
                              onPressed: () {},
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: AppKhaledStyles.textStyle(
                                    color: AppColors.c4C9EEB,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          state is AddPostLoadingState
                              ? SizedBox(
                                  width: 10.w,
                                  height: 10.w,
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    communityBloc.addNewPost(
                                        body: communityBloc.bodyController.text,
                                        title: communityBloc
                                            .postTitleController.text);
                                  },
                                  child: Container(
                                    width: 67.w,
                                    height: 34.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.cB9DCF7,
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Post',
                                        style: AppKhaledStyles.textStyle(
                                          color: AppColors.white,
                                          size: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            width: 21.w,
                          ),
                        ],
                      ),
                    ),
                       State is AddPostLoadingState ?
                       Shimmer.fromColors(
                         baseColor: AppColors.cE1E1E1,
                         highlightColor: AppColors.primary,
                         child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 20.w,
                                top: 30.h,
                                end: 20.w),
                            child: Container(
                              width: double.infinity,
                              height: 100.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                      color: AppColors.primary
                                  )
                              ),
                              child: TextFormField(
                                controller: communityBloc.postTitleController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Add Your Title her',
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                                    hintStyle: AppKhaledStyles.textStyle(
                                        color: AppColors.c687684
                                    )
                                ),
                              ),
                            ),
                          ),
                       ):Padding(
                         padding: EdgeInsetsDirectional.only(
                             start: 20.w,
                             top: 30.h,
                             end: 20.w),
                         child: Container(
                           width: double.infinity,
                           height: 100.h,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(16.r),
                               border: Border.all(
                                   color: AppColors.primary
                               )
                           ),
                           child: TextFormField(
                             controller: communityBloc.postTitleController,
                             keyboardType: TextInputType.text,
                             decoration: InputDecoration(
                                 hintText: 'Add Your Title her',
                                 enabledBorder: InputBorder.none,
                                 border: InputBorder.none,
                                 focusedBorder: InputBorder.none,
                                 contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                                 hintStyle: AppKhaledStyles.textStyle(
                                     color: AppColors.c687684
                                 )
                             ),
                           ),
                         ),
                       ),

                       state is AddPostLoadingState?

                       Expanded(
                         child: Shimmer.fromColors(
                           baseColor: AppColors.cE1E1E1,
                           highlightColor: AppColors.primary,
                           child: Padding(
                                padding: EdgeInsetsDirectional.only(start: 20.w,
                                    top: 30.h,
                                    end: 20.w),
                                child: Container(
                                  width: double.infinity,
                                  height: 300.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      border: Border.all(
                                          color: AppColors.primary
                                      )
                                  ),
                                  child: Expanded(
                                    child: TextFormField(
                                      controller: communityBloc.bodyController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'Add Your Content here',
                                          enabledBorder: InputBorder.none,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                                          hintStyle: AppKhaledStyles.textStyle(
                                              color: AppColors.c687684,
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                         ),
                       ):Expanded(
                         child: Padding(
                           padding: EdgeInsetsDirectional.only(start: 20.w,
                               top: 30.h,
                               end: 20.w),
                           child: Container(
                             width: double.infinity,
                             height: 300.h,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(16.r),
                                 border: Border.all(
                                     color: AppColors.primary
                                 )
                             ),
                             child: Expanded(
                               child: TextFormField(
                                 controller: communityBloc.bodyController,
                                 keyboardType: TextInputType.text,
                                 decoration: InputDecoration(
                                     hintText: 'Add Your Content here',
                                     enabledBorder: InputBorder.none,
                                     border: InputBorder.none,
                                     focusedBorder: InputBorder.none,
                                     contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                                     hintStyle: AppKhaledStyles.textStyle(
                                       color: AppColors.c687684,
                                     )
                                 ),
                               ),
                             ),
                           ),
                         ),),

                      state is AddPostLoadingState?
                       Shimmer.fromColors(
                         baseColor: AppColors.cE1E1E1,
                         highlightColor: AppColors.primary,
                         child: Padding(
                            padding:  EdgeInsets.only(top: 30.h),
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 94.h,
                              child: ListView.separated(
                                  padding: EdgeInsetsDirectional.all(8.w),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      CmaeraPostContainer(
                                        cameraPostsModedl: communityBloc
                                            .cameraPostsData[index],

                                      ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 12.w),
                                  itemCount: 4),
                            ),
                          ),
                       ):
                      Padding(
                        padding:  EdgeInsets.only(top: 30.h),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 94.h,
                          child: ListView.separated(
                              padding: EdgeInsetsDirectional.all(8.w),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  CmaeraPostContainer(
                                    cameraPostsModedl: communityBloc
                                        .cameraPostsData[index],

                                  ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 12.w),
                              itemCount: 4),
                        ),
                      ),
                    ],
                  ),
            );
      },
    );
  }
}


