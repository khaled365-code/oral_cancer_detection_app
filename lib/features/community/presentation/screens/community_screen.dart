import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/features/community/presentation/screens/no_posts_screen.dart';
import 'package:graduation_project/features/community/presentation/widgets/test_widget.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/image_constants.dart';
import '../widgets/post_container.dart';

class CommunityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
      listener: (context, state)
      {

        if(state is GetAllPostsSuccessState)
          {
            showToast(msg: 'Posts Successfully Loaded',toastStates: ToastStates.success);
          }
        if(state is GetAllPostsFailureState)
          {
            // showSnackBar(context,
            //         color: AppColors.c3F4042,
            //         specificWidget: Row(
            //           children:
            //           [
            //             SizedBox(width: 5.w,),
            //             Icon(Icons.wifi_off, size: 20.sp, color: AppColors.white,),
            //             SizedBox(width: 10.w,),
            //             Text(
            //               state.errorMessage,style: AppTextStyles.font12.copyWith(color: AppColors.white),)
            //
            //           ],
            //         )
            //     );
            showToast(msg: state.errorMessage, toastStates: ToastStates.error);


          }


      },
      builder: (context, state) {
        return BlocBuilder<GlobalCommunityBloc, GlobalCommunityBlocState>(
          builder: (context, state) {
            final communityBloc = BlocProvider.of<GlobalCommunityBloc>(context);
            return Scaffold(
              body: state is GetAllPostsSuccessState ?
              CustomScrollView(
                slivers:
                [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => PostContainer(
                              data: state.postDetailsModel.data![index],
                              currentIndex: index,
                            ),
                        childCount: state.postDetailsModel.data!.length,
                      )),

                  SliverToBoxAdapter(
                      child: Container(
                    height: 80.h,
                    color: AppColors.white,
                    child: Center(
                      child: Container(
                        width: 20.w,
                        height: 20.h,
                        child: CircularProgressIndicator(
                          backgroundColor: AppColors.primary,
                          color: AppColors.cE1E1E1,
                          strokeWidth: 2,

                        ),
                      ),
                    ),
                  ))
                ],
              )
                  :
              state is GetAllPostsFailureState ?
              const NoPostsScreen() :
                Column(
                  children:
                  [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            PostWithNoDataWidget(postDataModel: communityBloc
                                .postsDataList[index],
                                currentIndex: index),
                        itemCount: communityBloc.postsDataList.length,
                      ),
                    ),
                  ],
                ),



              floatingActionButton: GestureDetector(
                onTap: ()
                {
                  navigate(context: context, route: Routes.addPostScreen);
                },
                child: Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle
                    ), child: Image.asset(ImageConstants.addTwitterTextImage)),
              ),


            );
          },
        );
      },
    );
  }

/*

  Column(
                children:
                [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          PostContainer(
                            data: state.postDetailsModel.data![index],
                            currentIndex: index,
                          ),
                      itemCount: state.postDetailsModel.data!.length,
                    ),
                  ),
                ],
              )
   */
}



