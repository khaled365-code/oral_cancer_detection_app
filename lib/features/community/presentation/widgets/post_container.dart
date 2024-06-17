
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/Data.dart';
import 'package:graduation_project/features/community/presentation/widgets/retweet_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/utilis/app_colors.dart';

class PostContainer extends StatelessWidget {


  final NewAllPostsData data;

  final double maxWidth;

  final bool isPostDetailsScreen;














  PostContainer({
    super.key, required this.data, required this.maxWidth, required this.isPostDetailsScreen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
    listener: (context, state)
    {

    },
      builder: (context, state) {
        final communityBloc=BlocProvider.of<GlobalCommunityBloc>(context);

        return Container(
          width: maxWidth,
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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 5.w, top: 10.h),
                    child: Container(
                      width: 55.w,
                      height: 55.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: data.userdata!.profilePhotoUrl!=null? DecorationImage (
                          image: CachedNetworkImageProvider(data.userdata!.profilePhotoUrl!),
                          fit: BoxFit.fill
                        ):DecorationImage (
                            image: AssetImage(ImageConstants.userDefaultImage),
                            fit: BoxFit.fill
                        )
                      )
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10.h,),
                        Row(
                          children:
                          [

                            Text('${getUserName(currentUserName: data.userdata!.name??'')}',
                              style: AppKhaledStyles.textStyle(
                              color: AppColors.black,
                              weight:FontWeight.w700 ,
                              size: 13,
                            ),),
                            SizedBox(width: 3.h,),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Text('${getEmail(currentEmail:data.userdata!.email??'')}', style: AppKhaledStyles
                                  .textStyle(
                                color: AppColors.c687684,
                                weight:FontWeight.w500 ,
                                size: 11,
                              ),),
                            ),
                            SizedBox(width: 5.h,),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Text('${getTimeDifference(postDate: DateTime.parse(data.post!.createdAt??''))}', style: AppKhaledStyles.textStyle(
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
                                  child: Image.asset(ImageConstants.downArrowImage)),
                            ),

                          ],
                        ),
                        SizedBox(height: 2.h,),
                        data.post!.body!=null?
                        Text(
                          data.post!.body!,
                          style: AppKhaledStyles.textStyle(
                            color: AppColors.black,
                            size: 14,
                            weight: FontWeight.w400,
                          ),):
                        SizedBox.shrink(),

                        isPostDetailsScreen==false?
                        GestureDetector(
                          onTap: ()
                          {
                            communityBloc.getAllComments(postId: data.post!.id!);
                            navigate(context: context, route: Routes.postDetailsScreen,arg:data);

                          },
                          child: ResuableText(
                            fontSize: 14,
                            text: 'show More',
                            color: AppColors.primary,
                          ),
                        )
                        :SizedBox.shrink(),

                        data.post!.image!=null? CachedNetworkImage(imageUrl:data.post!.image!,fit: BoxFit.fill,):SizedBox.shrink(),
                        SizedBox(height: 10.h,),
                        isPostDetailsScreen==false?
                        Row(
                          children:
                          [
                            GestureDetector(
                                onTap: ()
                                {
                                   navigate(context: context, route: Routes.commentScreen,arg: data);

                                },
                                child: Container(child: Image.asset(ImageConstants.commentImage))),
                            SizedBox(width: 3.5.w,),
                            Text('${data.commentCount}',
                              style: AppKhaledStyles.textStyle(
                                color: AppColors.grey,
                                size: 10,
                              ),),


                            Spacer(),


                            GestureDetector(
                                onTap: ()
                                {
                                  showModalBottomSheet(context: context,
                                    backgroundColor: AppColors.transparent,
                                    builder: (context) => RetweetBottomSheet(
                                      data: data,
                                    ),);
                                },
                                child: Container(child: Image.asset(ImageConstants.retweetImage))),
                            SizedBox(width: 3.5.w,),
                            Text('0',
                              style: AppKhaledStyles.textStyle(
                                color: AppColors.grey,
                                size: 10,
                              ),),



                            Spacer(),


                            InkWell(
                              onTap: () async
                                {
                                  await communityBloc.addLikeCount(
                                      postId: data.post!.id!,);
                                  communityBloc.getAllPostsFun();



                                },
                                child: data.likedByThisUser==1? Container(
                                    child:Image.asset(ImageConstants.redHeartImage)
                                ): Container(
                                        child: Image.asset(
                                            ImageConstants.heartImage))),
                            SizedBox(width: 3.5.w,),
                            Text('${data.likeCount}',
                              style: AppKhaledStyles.textStyle(
                                color: AppColors.grey,
                                size: 10,
                              ),),



                            Spacer(),
                            GestureDetector(
                                onTap: ()
                                {
                                  Share.share(data.post!.body!);
                                },
                                child: Container(child: Image.asset(ImageConstants.shareSmallImage,))),

                            SizedBox(width: 11.w,)


                          ],
                        ):
                        SizedBox.shrink(),
                        SizedBox(height: 10.h,),
                        isPostDetailsScreen==true?
                        SizedBox(height: 10.h,):SizedBox.shrink()


                      ],
                    ),
                  )


                ],
              ),

            ],
          ),
        );
      },
    );
  }
}
