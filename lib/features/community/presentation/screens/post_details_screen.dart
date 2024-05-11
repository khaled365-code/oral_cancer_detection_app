

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/features/community/data/models/Data.dart';
import 'package:graduation_project/features/community/presentation/widgets/comment_container.dart';
import 'package:graduation_project/features/community/presentation/widgets/one_only_post_widget.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/custom_app_bar.dart';
import '../../../../core/utilis/image_constants.dart';
import '../widgets/post_details_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
  listener: (context, state)
  { 
    if(state is AddCommentLoadingState)
      {
        showToast(msg: 'Comment Posted Success', toastStates: ToastStates.success);
      }
    if(state is AddCommentFailureState)
      {
        showToast(msg: state.errorMessage, toastStates: ToastStates.error);
      }

  },
  builder: (context, state) {
    final communityBloc=BlocProvider.of<GlobalCommunityBloc>(context);
    final recievedData=ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 40.h),
        child: DefaultAppBar(
          leading: Padding(
            padding:  EdgeInsetsDirectional.only(start: 5.w),
            child: IconButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.c4C9EEB,size: 15.sp,),),
          ),
          title: Text('Post',
            style: AppKhaledStyles.textStyle(
                color: AppColors.black,
                size: 16 ,
                weight: FontWeight.bold
            ),),
          hasActions: false,
          hasLeading: true,
          hasTitle: true,

        ),
      ),
      body: CustomScrollView(
        slivers:
        [
          SliverToBoxAdapter(
            child: OnlyOnePostWidget(
              data:recievedData
          ),),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) =>
                  Padding(
                    padding:EdgeInsetsDirectional.only(start: 20.w),
                    child: CommentContainer(
                      recievedData: recievedData,
                                    currentIndex: index,
                                    postDataModel: communityBloc.postsDataList[index],
                                  ),
                  ),
                childCount: communityBloc.postsDataList.length,
              )),

          SliverToBoxAdapter(
            child: Container(
              color: AppColors.cE7ECF0,
              height: 7.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 52.h,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color:AppColors.cE7ECF0,
                          width: 3.w
                      )
                  )
              ),
              child: Row(
                children: [
                  SizedBox(width: 20.w,),
                  Image.asset(ImageConstants.roundPostTwitter),
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: Container(
                      height: 35.h,
                      decoration: BoxDecoration(
                          color: AppColors.cE7ECF0,
                          borderRadius: BorderRadius.circular(25.r)
                      ),
                      child: TextField(
                        controller: communityBloc.addCommentControllerField,
                        onSubmitted: (value)
                        {
                          communityBloc.addComment(
                              postId: recievedData.post!.id!,
                              userId: recievedData.post!.userId!,
                              comment: value);

                          communityBloc.addCommentControllerField.clear();


                        },
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsetsDirectional.only(start: 12.w,bottom: 8.h,),
                            hintText: 'Tweet your reply',

                            hintStyle: AppKhaledStyles.textStyle(
                              color: AppColors.cAFB8C1,
                              size: 12,
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w,),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40.h,
              color: AppColors.cE7ECF0,
            ),
          )
        ],
      ),

    );
  },
);
  }
}
