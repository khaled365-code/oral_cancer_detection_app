import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/features/community/presentation/widgets/retweet_bottom_sheet.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/utilis/colors.dart';
import '../../data/models/post_data_model.dart';

class PostContainer extends StatelessWidget {

  final PostDataModel postDataModel;
  final int currentIndex;










  PostContainer({
    super.key, required this.postDataModel, required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
    listener: (context, state)
    {
     // TODO: implement listener
    },
      builder: (context, state) {
        final communityBloc=BlocProvider.of<GlobalCommunityBloc>(context);
        return GestureDetector(
      onTap: ()
      {
        navigate(context: context, route: Routes.postDetailsScreen);
      },
      child: Container(
        width: 414.w,
        height: 130.h,
        padding: EdgeInsetsDirectional.only(end: 20.w,),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, .33),
                color: AppColors.white,
                spreadRadius: 0.r,
                blurRadius: 0.r,
              ),
            ],
            border: Border.all(
                color: AppColors.cE7E7E7,
                width: 1
            )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
              child: Container(
                width: 55.w,
                height: 55.w,
                decoration: BoxDecoration(
                ), child: CircleAvatar(
                  backgroundColor: AppColors.transparent,
                  child: Image.asset(postDataModel.postOwnerPhoto, fit: BoxFit.contain,)),
              ),
            ),
            SizedBox(width: 8.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(postDataModel.owner, style: AppKhaledStyles.textStyle(
                        color: AppColors.black,
                        weight:FontWeight.w700 ,
                        size: 13,
                      ),),
                      SizedBox(width: 3.h,),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Text(postDataModel.userName, style: AppKhaledStyles
                            .textStyle(
                          color: AppColors.c687684,
                          weight:FontWeight.w500 ,
                          size: 11,
                        ),),
                      ),
                      SizedBox(width: 5.h,),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Text('${postDataModel.hours}h', style: AppKhaledStyles.textStyle(
                          color: AppColors.c687684,
                          weight:FontWeight.w500 ,
                          size: 10,
                        ),),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: SizedBox(
                            width: 10.25,
                            height: 5.5,
                            child: Image.asset(
                                ImageConstants.downArrowImage)),
                      ),

                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Text(
                    postDataModel.content,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      size: 14,
                      weight: FontWeight.w400,

                    ),),
                  SizedBox(height: 10.h,),
                  Row(
                    children:
                    [
                      Image.asset(ImageConstants.commentImage),
                      SizedBox(width: 3.5.w,),
                      Text('${postDataModel.commentNumber}',
                        style: AppKhaledStyles.textStyle(
                          color: AppColors.grey,
                          size: 10,
                        ),),
                      Spacer(),
                      GestureDetector(
                          onTap: ()
                          {
                            communityBloc.changeHeartFun(currentIndex,communityBloc.postsDataList);
                          },
                          child: Image.asset(postDataModel.heartIsActive==true?ImageConstants.redHeartImage:ImageConstants.heartImage)),
                      SizedBox(width: 3.5.w,),
                      Text('${postDataModel.loveNumber}',
                        style: AppKhaledStyles.textStyle(
                          color: AppColors.grey,
                          size: 10,
                        ),),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            communityBloc.changeRetweetFun(currentIndex,communityBloc.postsDataList);
                            showModalBottomSheet(context: context,
                              backgroundColor: AppColors.transparent,
                              builder: (context) => RetweetBottomSheet(currentIndex: currentIndex,),);
                          },
                          child: Image.asset(postDataModel.retweetIsActive==true?ImageConstants.greenRetweetImage:ImageConstants.retweetImage)),
                      SizedBox(width: 3.5.w,),
                      Text('${postDataModel.retweetNumber}',
                        style: AppKhaledStyles.textStyle(
                          color: AppColors.grey,
                          size: 10,
                        ),),
                      Spacer(),


                    ],
                  )
                ],
              ),
            )


          ],
        ),
      ),
    );
      },
    );
  }
}
/*

Column(
      children: [
        SizedBox(height: 10.h,),
        Container(
          height: 210.h,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage: AssetImage(postOwnerPhoto),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                postOwner,
                                style: AppTextStyles.font16,
                              ),
                              Spacer(),
                              Text(postHours),
                              SizedBox(width: 10.w),
                              Icon(Icons.linear_scale),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Expanded(
                            child: Text(
                              postText,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.font16,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.comment_sharp),
                              SizedBox(width: 100.w,),
                              Icon(Icons.favorite),
                              SizedBox(width: 100.w,),
                              Icon(Icons.share),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ],
    )

 */
