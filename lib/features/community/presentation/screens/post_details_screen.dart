

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/features/community/presentation/widgets/comment_container.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/custom_app_bar.dart';
import '../../../../core/utilis/image_constants.dart';
import '../widgets/post_details_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final communityBloc=BlocProvider.of<GlobalCommunityBloc>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 40.h),
        child: DefaultAppBar(
          leading: Padding(
            padding:  EdgeInsetsDirectional.only(start: 18.5.w),
            child: IconButton(
              onPressed: (){
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
          SliverToBoxAdapter(child: PostDetailsWidget()),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => CommentContainer(
                currentIndex: index,
                postDataModel: communityBloc.postsDataList[index],
              ),
                childCount: communityBloc.postsDataList.length,
              )),
          SliverToBoxAdapter(
            child: Container(
              height: 32.5.h,
              color: AppColors.white,
            ),
          ),
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
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsetsDirectional.only(start: 12.w,bottom: 8.h,top: 8.h),
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
              height: 48.h,
              color: AppColors.cE7ECF0,
            ),
          )
        ],
      ),

    );
  }
}
