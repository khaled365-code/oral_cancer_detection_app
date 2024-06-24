


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/utilis/app_khaled_styles.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/fontweight_helper.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/Data.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var recievedData=ModalRoute.of(context)!.settings.arguments as NewAllPostsData;
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
  listener: (context, state)
  {
    if(state is AddCommentSuccessState)
    {
      showToast(msg: 'Comment Posteded Successfully', toastStates: ToastStates.success);
       BlocProvider.of<GlobalCommunityBloc>(context).getAllPostsFun();
      Navigator.pop(context);
    }
    if(state is AddCommentFailureState)
    {
      showToast(msg: state.errorMessage, toastStates: ToastStates.error);
    }
  },
  builder: (context, state) {
    final communityBloc=BlocProvider.of<GlobalCommunityBloc>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child:
            Column(
              children:
              [
                state is AddCommentLoadingState?
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40.h,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w),
                        child: GestureDetector(
                          onTap: ()
                          {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: AppKhaledStyles.textStyle(
                                color: AppColors.c4C9EEB,
                                size: 17,
                                weight: FontWeightHelper.regular
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 25.w,
                        height: 25.h,
                        child: const CircularProgressIndicator(
                          color: AppColors.primary,
                          strokeWidth: 2,
                        ),
                      ),
                      SizedBox(
                        width: 21.w,
                      ),
                    ],
                  ),
                ):
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40.h,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w),
                        child: GestureDetector(
                          onTap: ()
                          {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: AppKhaledStyles.textStyle(
                              color: AppColors.c4C9EEB,
                              size: 17,
                              weight: FontWeightHelper.regular
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () async
                        {
                          await communityBloc.addComment(
                              postId: recievedData.post!.id!,
                              comment: communityBloc.addCommentforScreenController.text);
                          communityBloc.addCommentforScreenController.clear();

                        },
                        child: Container(
                          width: 67.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Center(
                            child: Text(
                              'Post',
                              style: AppKhaledStyles.textStyle(
                                color: AppColors.white,
                                size: 15,
                                weight: FontWeightHelper.regular

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

                SizedBox(height: 5.h,),
                LineWidget(
                  height: 2,
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 20.w),
                  child: Row(
                    children:
                    [
                      Container(
                        width: 1.w,
                        height: 30.h,
                        color:  AppColors.cCED5DC,
                      ),
                     SizedBox(width: 20.w,),
                      Padding(
                        padding:  EdgeInsets.only(top: 5.h),
                        child: ResuableText(text: 'Replying to',
                          color: AppColors.c727E8B,
                          fontSize: 14,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Padding(
                        padding:  EdgeInsets.only(top: 5.h),
                        child: ResuableText(text: '${getUserName(currentUserName: recievedData.userdata!.name!)}',
                          color: AppColors.c4C9EEB,
                          fontSize: 14,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 15.w),
                  child: Row(
                    children:
                    [
                      Container(
                        width: 55.w,
                        height: 55.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage (
                                image: CachedNetworkImageProvider(
                                    CacheHelper().getData(key: 'updatedImage')
                                ),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Expanded(
                          child: Padding(
                            padding:  EdgeInsetsDirectional.only(start: 5.w,end: 10.w),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: communityBloc.addCommentforScreenController,
                                  onFieldSubmitted: (value)
                                  {
                                    communityBloc.addComment(
                                        postId: recievedData.post!.id!,
                                        comment: value);
                                    communityBloc.addCommentforScreenController.clear();

                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: 'Post Your Comment',
                                    hintTextDirection: TextDirection.ltr,
                                      hintStyle: AppKhaledStyles.textStyle(
                                        color: AppColors.c687684,
                                        size: 14,
                                        weight: FontWeightHelper.regular
                                      )

                                  ),
                                ),
                              ],
                            ),
                          ))

                    ],
                  ),
                )
              ],
            ),
          )),
    );
  },
);
  }
}
