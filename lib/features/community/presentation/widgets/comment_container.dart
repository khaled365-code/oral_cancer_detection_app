

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../data/models/post_data_model.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({super.key, required this.postDataModel, required this.currentIndex});

  final PostDataModel postDataModel;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    final communityBloc=BlocProvider.of<GlobalCommunityBloc>(context);
    return Container(
      width: 414.w,
      height: 140.h,
      margin:  EdgeInsetsDirectional.only(start: 20.w,bottom: 21.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, .33),
              color: AppColors.white,
              spreadRadius: 0.r,
              blurRadius: 0.r,
            ),
          ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsetsDirectional.only(top: 11.h),
            child: Container(
              width: 55.w,
              height: 55.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ), child: Image.asset(ImageConstants.manCommentImage,fit: BoxFit.contain,),
            ),
          ),
          SizedBox(width: 8.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Text(postDataModel.owner,style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight:FontWeight.w700 ,
                      size: 13 ,
                    ),),
                    SizedBox(width: 3.h,),
                    Padding(
                      padding:  EdgeInsets.only(top: 2.h),
                      child: Text(postDataModel.userName,style: AppKhaledStyles.textStyle(
                        color: AppColors.c687684,
                        weight:FontWeight.w500 ,
                        size: 11,
                      ),),
                    ),
                    SizedBox(width: 5.h,),
                    Padding(
                      padding:  EdgeInsets.only(top: 2.h),
                      child: Text('${postDataModel.hours}d',style: AppKhaledStyles.textStyle(
                        color: AppColors.c687684,
                        weight:FontWeight.w500 ,
                        size: 10,
                      ),),
                    ),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(top: 2.h),
                      child: SizedBox(
                          width: 10.25,
                          height: 5.5,
                          child: Image.asset(ImageConstants.downArrowImage)),
                    ),
                    SizedBox(width: 19.38.w,)

                  ],
                ),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                    ResuableText(text: 'Replying to',
                      color: AppColors.c727E8B,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(width: 5.w,),
                    ResuableText(text: postDataModel.owner,
                      color: AppColors.c4C9EEB,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    )
                  ],
                ),
                SizedBox(height: 6.h,),
                Text(postDataModel.content,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: AppKhaledStyles.textStyle(
                    color: AppColors.black,
                    size: 14,
                    weight: FontWeight.w400,

                  ),),
                Spacer(),
                Row(
                  children:
                  [
                    Image.asset(ImageConstants.commentImage),
                    SizedBox(width: 3.5.w,),
                    Text('${postDataModel.commentNumber}',
                      style: AppKhaledStyles.textStyle(
                        color: AppColors.grey,
                        size: 10 ,
                      ),),
                    Spacer(),
                    GestureDetector(
                      onTap: ()
                        {
                          communityBloc.changeHeartFun(currentIndex,communityBloc.postsDataList);
                        },
                        child: Image.asset(postDataModel.heartIsActive==false?ImageConstants.heartImage:ImageConstants.redHeartImage)),
                    SizedBox(width: 3.5.w,),
                    Text('${postDataModel.loveNumber}',
                      style: AppKhaledStyles.textStyle(
                        color: AppColors.grey,
                        size: 10 ,
                      ),),
                    Spacer(),
                    GestureDetector(
                      onTap: ()
                        {
                          communityBloc.changeRetweetFun(currentIndex, communityBloc.postsDataList);
                        },
                        child: Image.asset(postDataModel.retweetIsActive==false?ImageConstants.retweetImage:ImageConstants.greenRetweetImage)),
                    SizedBox(width: 3.5.w,),
                    Text('${postDataModel.retweetNumber}',
                      style: AppKhaledStyles.textStyle(
                        color: AppColors.grey,
                        size: 10 ,
                      ),),
                    SizedBox(width: 40.w,)


                  ],
                )
              ],
            ),
          )


        ],
      ),
    );
  },
);
  }
}
