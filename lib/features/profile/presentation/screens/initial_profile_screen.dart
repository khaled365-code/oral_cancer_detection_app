import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/core/utilis/custom_app_bar.dart';
import 'package:graduation_project/core/widgets/custom_image_picker.dart';
import 'package:graduation_project/features/profile/presentation/components/profile_item_widget.dart';
import 'package:graduation_project/features/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/commons/global_cubits/get_profile_data_cubit/profile_cubit.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';

class ProfileOutScreen extends StatelessWidget {
  ProfileOutScreen({super.key});


  @override
  Widget build(BuildContext context) {
   
    return BlocConsumer<GetProfileDataCubit, GetProfileDataCubitState>(
          listener: (context, state) {
            if (state is ProfileSuccess)
              {
                log('hello');
                log(state.userProfile.userImage.toString());
              }
          },
          builder: (context, state) {
            final profileCubit = BlocProvider.of<GetProfileDataCubit>(context);
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, 40.h),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 5.w),
                  child: DefaultAppBar(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.cEFF0F3,
                                width: 2.w
                            )
                        ),
                        child: Icon(Icons.arrow_back, size: 20.sp,),
                      ),
                    ),
                    title: Text('Profile',
                      style: AppKhaledStyles.textStyle(color: AppColors.black,
                          weight: FontWeight.bold, size: 16),),
                    hasLeading: true,
                    hasTitle: true,
                    hasActions: false,
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 10, start: 20.w, end: 20.w),
                child: CustomScrollView(
                  slivers:
                  [
                    state is ProfileSuccess ?
                    SliverToBoxAdapter(
                      child: CustomImagePickerAvatar(
                        image: NetworkImage(state.userProfile.userImage),
                        hasBottom: true,
                        hasEnd: true,
                        hasCustomChild: true,
                        customChild: Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.c0165FC,
                              border: Border.all(
                                  color: AppColors.white, width: 2.w)),
                          child: Image.asset(
                            ImageConstants.pencilImage,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ) :SliverToBoxAdapter(
                      child: CustomImagePickerAvatar(
                        image: AssetImage(ImageConstants.ProfileUserImage),
                        hasBottom: true,
                        hasEnd: true,
                        hasCustomChild: true,
                        customChild: Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.c0165FC,
                              border: Border.all(
                                  color: AppColors.white, width: 2.w)),
                          child: Image.asset(
                            ImageConstants.pencilImage,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),

                    // SliverToBoxAdapter(
                    //   child: Center(
                    //     child: Stack(
                    //       clipBehavior: Clip.none,
                    //       children: [
                    //         Container(
                    //           width: 100.w,
                    //           height: 100.h,
                    //           decoration: BoxDecoration(
                    //             shape: BoxShape.circle,
                    //           ),
                    //           child: Image.asset(ImageConstants.manCommentImage,fit: BoxFit.fill,),
                    //         ),
                    //         PositionedDirectional(
                    //           bottom: -7.h,
                    //           end: -2.w,
                    //           child: Container(
                    //             width: 35.w,
                    //             height: 35.h,
                    //             decoration: BoxDecoration(
                    //                 shape: BoxShape.circle,
                    //                 color: AppColors.c0165FC,
                    //                 border: Border.all(
                    //                     color: AppColors.white,
                    //                     width: 2.w
                    //                 )
                    //             ),
                    //             child: Image.asset(ImageConstants.pencilImage,color: AppColors.white,),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15.h,
                      ),
                    ),
                    state is ProfileSuccess ?
                    SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          state.userProfile.name,
                          style: AppKhaledStyles.textStyle(
                              color: AppColors.black,
                              weight: FontWeight.bold,
                              size: 15.sp),
                        ),
                      ),
                    ) : SliverToBoxAdapter(child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Shimmer.fromColors(
                        baseColor: AppColors.cE1E1E1,
                        highlightColor: AppColors.cE1E1E1,
                        child: Center(
                          child: Text(
                            'please wait', style: AppKhaledStyles.textStyle(
                              color: AppColors.black,
                              weight: FontWeight.bold,
                              size: 15.sp
                          ),),
                        ),
                      ),
                    ),),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 3.h,
                      ),
                    ),
                    state is ProfileSuccess ?
                    SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          state.userProfile.email,
                          style: AppKhaledStyles.textStyle(
                              color: AppColors.grey,
                              weight: FontWeight.normal,
                              size: 15.sp),
                        ),
                      ),
                    ) :
                    SliverToBoxAdapter(
                      child: SizedBox(
                        width: 200.0,
                        height: 100.0,
                        child: Shimmer.fromColors(
                          baseColor: AppColors.cE1E1E1,
                          highlightColor: AppColors.cE1E1E1,
                          child: Center(
                            child: Text(
                              'please wait', style: AppKhaledStyles.textStyle(
                                color: AppColors.grey,
                                weight: FontWeight.normal,
                                size: 15.sp
                            ),),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 25.h,
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) =>
                            ProfileItemWidget(
                              currentIndex: index,
                              profileDataModel: profileCubit
                                  .profileDataList[index],
                            ),
                            childCount: profileCubit.profileDataList.length
                        )),
                  ],

                ),
              ),
            );
          },
        );
  }
}

