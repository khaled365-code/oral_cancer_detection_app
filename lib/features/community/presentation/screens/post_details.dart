import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_khaled_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/default_app_bar.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/Data.dart';
import 'package:graduation_project/features/community/presentation/widgets/comment_container.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';
import 'package:graduation_project/features/community/presentation/widgets/post_container.dart';

import '../../../../core/utilis/fontweight_helper.dart';

class PostDetails extends StatelessWidget
{
  const PostDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final recievedData=ModalRoute.of(context)!.settings.arguments as NewAllPostsData;
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
      listener: (context, state)
      {
        if(state is AddCommentSuccessState)
        {
          showToast(msg: state.successMessage, toastStates: ToastStates.success);
        }
        if(state is AddCommentFailureState)
        {
          showToast(msg: state.errorMessage, toastStates: ToastStates.error);

        }
      },
      builder: (context, state) {
        final communityCubit = BlocProvider.of<GlobalCommunityBloc>(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 40.h),
            child: DefaultAppBar(
              leading: Padding(
                padding:  EdgeInsetsDirectional.only(start: 5.w),
                child: GestureDetector(
                  onTap: ()
                  {
                    Navigator.pop(context);
                    BlocProvider.of<GlobalCommunityBloc>(context).getAllPostsFun();

                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primary,
                    size: 15.sp,
                  ),
                )
              ),
              title: Text(
                'Post',
                style: AppKhaledStyles.textStyle(
                    color: AppColors.c141619,
                    size: 17 ,
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
              const SliverToBoxAdapter(
                child: LineWidget(),
              ),
              SliverToBoxAdapter(
                child: PostContainer(
                  isPostDetailsScreen: true,
                  data: recievedData,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
              ),
              const SliverToBoxAdapter(
                child: LineWidget(),
              ),
              state is GetAllCommentsSuccessState?
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                          padding: EdgeInsetsDirectional.only(start: 25.w,end: 12.w,top: index==0?11.h:0),
                          child:CommentContainer(
                            width: MediaQuery.of(context).size.width,
                            comments:state.commentsModel.comments![index],
                            recievedData: recievedData, currentIndex: index,
                          ),
                      ),
                      childCount:state.commentsModel.comments!.length)):
              SliverFillRemaining(
                child: Container(
                  color: AppColors.cE7ECF0,
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  color: AppColors.cE7ECF0,
                ),
              ),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 10.w),
                        child: Container(
                          width: 35.w,
                          height: 35.h,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              image: CacheHelper().getData(key: ApiKeys.profile_photo_url) != null ?
                              DecorationImage(
                                  image: NetworkImage(
                                      "${CacheHelper().getData(key: ApiKeys.profile_photo_url)}"),
                                  fit: BoxFit.fill):
                              DecorationImage(
                                  image: AssetImage(ImageConstants.userDefaultImage),
                                  fit: BoxFit.fill)
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      Container(
                        height: 35.h,
                        width: MediaQuery.of(context).size.width*.7,
                        decoration: BoxDecoration(
                            color: AppColors.cE7ECF0,
                            borderRadius: BorderRadius.circular(25.r)
                        ),
                        child: TextField(
                          controller: communityCubit.addCommentControllerField,
                          onSubmitted: (value) async
                          {
                            await communityCubit.addComment(
                                postId: recievedData.post!.id!,
                                comment: value);
                            communityCubit.addCommentControllerField.clear();

                            communityCubit.getAllComments(postId: recievedData.post!.id!);

                          },
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.only(start: 12.w,bottom: 8.h,),
                              hintText: 'Add your reply',
                              hintStyle: AppKhaledStyles.textStyle(
                                color: AppColors.c687684,
                                size: 16,
                                weight: FontWeightHelper.regular
                              )
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async
                        {
                          await communityCubit.addComment(
                              postId: recievedData.post!.id!,
                              comment: communityCubit.addCommentControllerField.text);
                          communityCubit.addCommentControllerField.clear();
                          communityCubit.getAllComments(postId: recievedData.post!.id!);

                        },
                        child: SvgPicture.asset(ImageConstants.addIcon,color: AppColors.primary,),
                      ),
                      SizedBox(width: 15.w,),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 5.h,),
              )
            ],
          ),
        );
      },
    );
  }
}
