import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/community/presentation/views/no_posts_screen.dart';
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

            showToast(msg: state.errorMessage, toastStates: ToastStates.error);
          }


      },
      builder: (context, state) {
        return BlocBuilder<GlobalCommunityBloc, GlobalCommunityBlocState>(
          builder: (context, state) {
            final communityBloc = BlocProvider.of<GlobalCommunityBloc>(context);
            final refreshIndicatorKey=GlobalKey<RefreshIndicatorState>();
            return Scaffold(
              body: state is GetAllPostsSuccessState ?
              RefreshIndicator(
                edgeOffset: 1,
                key: refreshIndicatorKey,
                color: AppColors.primary,
                onRefresh: () async
                {
                  await communityBloc.getAllPostsFun();
                },
                child: CustomScrollView(
                  slivers:
                  [
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index)
                          {
                            final length = state.postDetailsModel.data!.length;
                            final reversedIndex = length - 1 - index;
                            return PostContainer(
                              currentIndex: index,
                              newAllPostsDataList: state.postDetailsModel.data,
                              isPostDetailsScreen: false,
                              maxWidth: MediaQuery.of(context).size.width,
                              data: state.postDetailsModel.data![reversedIndex],
                            );},
                          childCount: state.postDetailsModel.data!.length,
                        )),
                  ],
                ),
              ) :
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

}



