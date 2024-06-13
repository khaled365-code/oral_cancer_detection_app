
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/commons/global_cubits/get_profile_data_cubit/profile_cubit.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/core/utilis/custom_app_bar.dart';
import 'package:graduation_project/core/widgets/custom_image_picker.dart';
import 'package:graduation_project/features/profile/presentation/components/profile_item_widget.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';

class ProfileOutScreen extends StatelessWidget {
  ProfileOutScreen({super.key});


  @override
  Widget build(BuildContext context) {
        return BlocConsumer<GetProfileDataCubit, GetProfileDataCubitState>(
          listener: (context, state) {

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
                    state is GetProfileDataSucccessState?
                    SliverToBoxAdapter(
                      child: Center(
                        child: CustomImagePickerAvatar(
                          image: NetworkImage(
                              state.getProfileDataModel.data!.profilePhotoUrl!),
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
                    ):
                    SliverToBoxAdapter(
                      child: Center(
                        child: CustomImagePickerAvatar(
                          image: NetworkImage(CacheHelper().getData(
                              key: ApiKeys.profile_photo_url)),
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
                    ),

                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15.h,
                      ),
                    ),
                    state is GetProfileDataSucccessState?
                    SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            state.getProfileDataModel.data!.name!,
                            style: AppKhaledStyles.textStyle(
                                color: AppColors.black,
                                weight: FontWeight.bold,
                                size: 15.sp),
                          ),
                        )):
                    SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            CacheHelper().getData(key: ApiKeys.name),
                            style: AppKhaledStyles.textStyle(
                                color: AppColors.black,
                                weight: FontWeight.bold,
                                size: 15.sp),
                          ),
                        )),

                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 3.h,
                      ),
                    ),
                    state is GetProfileDataSucccessState?
                    SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                          state.getProfileDataModel.data!.email!,
                            style: AppKhaledStyles.textStyle(
                                color: AppColors.grey,
                                weight: FontWeight.normal,
                                size: 15.sp),
                          ),
                        )):
                    SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            CacheHelper().getData(key: ApiKeys.email),
                            style: AppKhaledStyles.textStyle(
                                color: AppColors.grey,
                                weight: FontWeight.normal,
                                size: 15.sp),
                          ),
                        )),

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

