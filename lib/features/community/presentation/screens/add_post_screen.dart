import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/features/community/cubits/add_post_cubit/add_post_cubit.dart';
import 'package:graduation_project/features/community/data/repos/community_repo_implementation.dart';

import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';
import '../widgets/camera_post_container.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddPostCubit(communityRepoImplementation: CommunityRepoImplementation(
              api: DioConsumer(dio: Dio(),isModel: false))),
      child: BlocConsumer<AddPostCubit, AddPostState>(
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
        builder: (context, state) {
          final addPostCubit = BlocProvider.of<AddPostCubit>(context);
          return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              final communityBloc = BlocProvider.of<GlobalCommunityBloc>(
                  context);
              return Scaffold(
                  body: Column(
                    children: [
                      SizedBox(height: 50.h,),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 40.h,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 20.w),
                              child: TextButton(onPressed: () {}, child:
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel',
                                  style: AppKhaledStyles.textStyle(
                                    color: AppColors.c4C9EEB,
                                    size: 16,
                                  ),),
                              ),
                              ),
                            ),
                            Spacer(),
                            state is AddPostLoadingState ?
                            SizedBox(
                              width: 10.w,
                              height: 10.w,
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ):
                            GestureDetector(
                              onTap: ()
                              {
                                addPostCubit.addNewPost();
                                addPostCubit.postContentController.clear();
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
                                    'Post', style: AppKhaledStyles.textStyle(
                                    color: AppColors.white,
                                    size: 13,
                                  ),),
                                ),
                              ),
                            ),
                            SizedBox(width: 21.w,),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 20.w),
                          child: TextField(
                            controller: addPostCubit.postContentController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: Image.asset(ImageConstants
                                  .roundPostTwitter),
                              hintText: 'What’s happening?',
                              hintStyle: AppKhaledStyles.textStyle(
                                color: AppColors.c687684,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
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


                    ],
                  )
              );
            },
          );
        },
      ),
    );
  }
}


