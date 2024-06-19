

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/fontweight_helper.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/data/models/get_comments_model/Comments.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/Data.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';
import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/utilis/image_constants.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({super.key,required this.currentIndex, required this.recievedData, required this.comments, required this.width});

  final int currentIndex;
  final NewAllPostsData recievedData;
  final Comments comments;
  final double width;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    final communityBloc=BlocProvider.of<GlobalCommunityBloc>(context);
    return Container(
      width: width,
      color: AppColors.white,
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 55.w,
                      height: 55.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ), child:  CachedNetworkImage(imageUrl:comments.userdata!.profilePhotoUrl!,fit: BoxFit.contain,)
                    ),
                    Container(
                      width: 1.w,
                      height: 56.h,
                      color:  AppColors.cCED5DC,
                    ),
                  ],
                ),
                SizedBox(width: 8.w,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${getUserName(currentUserName: comments.userdata!.name!)}',style: AppKhaledStyles.textStyle(
                            color: AppColors.black,
                            weight:FontWeight.w700 ,
                            size: 13 ,
                          ),),
                          SizedBox(width: 3.h,),
                          Padding(
                            padding:  EdgeInsets.only(top: 2.h),
            
                              child:Text('${getEmail(currentEmail:comments.userdata!.email!)}',style: AppKhaledStyles.textStyle(
                              color: AppColors.c687684,
                              weight:FontWeight.w500 ,
                              size: 11,
                            ),)
                          ),
                          SizedBox(width: 5.h,),
                          Padding(
                            padding:  EdgeInsets.only(top: 2.h),
                            child: Text('${getTimeDifference(postDate: DateTime.parse(comments.comment!.createdAt!))}',style: AppKhaledStyles.textStyle(
                              color: AppColors.c687684,
                              weight:FontWeight.w500 ,
                              size: 10,
                            ),)),
                          Spacer(),
                          Padding(
                            padding:  EdgeInsets.only(top: 2.h),
                            child: SizedBox(
                                width: 10.25,
                                height: 5.5,
                                child: Image.asset(ImageConstants.downArrowImage,color:AppColors.primary,)),
                          ),
                          SizedBox(width: 19.38.w,)
            
                        ],
                      ),
                      SizedBox(height: 4.h,),
                      Row(
                        children: [
                          ResuableText(text: 'Replying to',
                            color: AppColors.c727E8B,
                            fontSize: 11,
                            fontWeight: FontWeightHelper.regular,
                          ),
                          SizedBox(width: 5.w,),
                          ResuableText(text: '${getUserName(currentUserName: recievedData.userdata!.name!)}',
                            color: AppColors.c4C9EEB,
                            fontSize: 11,
                            fontWeight: FontWeightHelper.regular,
                          )
                        ],
                      ),
                      SizedBox(height: 6.h,),
                      Text(
                        comments.comment!.comment!,
                        style: AppKhaledStyles.textStyle(
                          color: AppColors.black,
                          size: 15,
                          weight: FontWeightHelper.regular,
            
                        ),)
                    ],
                  ),
                ),
            
            
            
              ],
            ),
          ),


        ],
      ),
    );
  },
);
  }
}
