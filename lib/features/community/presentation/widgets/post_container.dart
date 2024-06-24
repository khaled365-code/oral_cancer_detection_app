
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/utilis/fontweight_helper.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/cubits/change_retweet_shape_cubit/change_retweet_shape_cubit.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/Data.dart';
import 'package:graduation_project/features/community/presentation/widgets/retweet_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/commons/global_cubits/get_profile_data_cubit/profile_cubit.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../cubits/change_post_heart_shape/change_post_heart_shape_cubit.dart';

class PostContainer extends StatelessWidget {


  final NewAllPostsData data;

  final double maxWidth;

  final bool isPostDetailsScreen;

  final List<NewAllPostsData>? newAllPostsDataList;
  final int? currentIndex;















  PostContainer({
    super.key, required this.data, required this.maxWidth, required this.isPostDetailsScreen, this.newAllPostsDataList, this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
  create: (context) => ChangePostHeartShapeCubit(),
  child: BlocConsumer<ChangePostHeartShapeCubit, ChangePostHeartShapeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    final changePostHeartShapeCubit=BlocProvider.of<ChangePostHeartShapeCubit>(context);
    return BlocConsumer<ChangeRetweetCubit, ChangeRetweetState>(
      listener: (context, retweetState) {
        // TODO: implement listener
      },
      builder: (context, retweetState) {
        final changeRetweetCubit=BlocProvider.of<ChangeRetweetCubit>(context);
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
                      width: 1.w
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
                              image: CachedNetworkImageProvider(
                                "https://162d-197-134-173-20.ngrok-free.app/storage/${data.userdata!.profilePhotoPath!}", ),
                              fit: BoxFit.fill
                            ):DecorationImage (
                                image: NetworkImage(BlocProvider.of<GetProfileDataCubit>(context).getOldImage()),
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
                                  color: AppColors.c141619,
                                  weight:FontWeight.w700 ,
                                  size: 13,
                                ),),
                                SizedBox(width: 3.h,),
                                Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: Text('@${getEmail(currentEmail:data.userdata!.email??'')}', style: AppKhaledStyles
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
                                      child: Image.asset(ImageConstants.downArrowImage,color: AppColors.primary,)),
                                ),

                              ],
                            ),
                            SizedBox(height: 2.h,),
                            data.post!.body!=null?
                            RichText(
                                text: TextSpan(
                                  children:
                                  [
                                    TextSpan(
                                      text: data.post!.body!,
                                      style: AppKhaledStyles.textStyle(
                                        color: AppColors.c141619,
                                        size: 14,
                                        weight: FontWeightHelper.regular,
                                      ),
                                    ),
                                    isPostDetailsScreen==false?
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()..onTap=()
                                      {
                                        communityBloc.getAllComments(postId: data.post!.id!);
                                        navigate(context: context, route: Routes.postDetailsScreen,arg:data);

                                      },
                                      text: '..show More',
                                      style:AppKhaledStyles.textStyle(
                                        size: 14,
                                        color: AppColors.primary,
                                        weight: FontWeightHelper.regular,

                                      ),
                                    ):
                                    TextSpan(),

                                  ]
                                )):
                            GestureDetector(
                              onTap: ()
                              {
                                communityBloc.getAllComments(postId: data.post!.id!);
                                navigate(context: context, route: Routes.postDetailsScreen,arg:data);
                              },
                              child:  ResuableText(
                                fontSize: 14,
                                text: 'show More',
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            data.post!.image!=null? CachedNetworkImage(
                              imageUrl:"https://162d-197-134-173-20.ngrok-free.app${data.post!.image!}"
                              ,fit: BoxFit.fill,)
                                :SizedBox.shrink(),
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
                                    color: AppColors.c687684,
                                    size: 12,
                                    weight: FontWeightHelper.regular,
                                  ),),


                                Spacer(),
                                GestureDetector(
                                    onTap: ()
                                    {
                                      changeRetweetCubit.changeRetweetShape();
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: AppColors.transparent,
                                        builder: (context) => RetweetBottomSheet(
                                          data: data,
                                        ),);
                                    },
                                    child: changeRetweetCubit.currentIndexISActive==true? Image.asset(ImageConstants.retweetImage,color: AppColors.c59BC6C,):
                                    Image.asset(ImageConstants.retweetImage)),
                                SizedBox(width: 3.5.w,),
                                Text('0',
                                  style: AppKhaledStyles.textStyle(
                                    color: AppColors.c687684,
                                    size: 12,
                                    weight: FontWeightHelper.regular,
                                  ),),



                                Spacer(),


                                GestureDetector(
                                  onTap: () async
                                    {
                                      changePostHeartShapeCubit.changeHeartShape();
                                      await communityBloc.addLikeCount(postId: data.post!.id!,);
                                    },
                                    child: changePostHeartShapeCubit.heartIsActive==true?  Image.asset(ImageConstants.redHeartImage):Image.asset(ImageConstants.heartImage)),
                                SizedBox(width: 3.5.w,),
                                changePostHeartShapeCubit.heartIsActive==true?
                                Text('${data.likeCount!+1}',
                                  style: AppKhaledStyles.textStyle(
                                    color: AppColors.c687684,
                                    size: 12,
                                    weight: FontWeightHelper.regular,
                                  ),):Text('${data.likeCount}',
                                  style: AppKhaledStyles.textStyle(
                                    color: AppColors.c687684,
                                    size: 12,
                                    weight: FontWeightHelper.regular,
                                  ),),



                                Spacer(),
                                GestureDetector(
                                    onTap: ()
                                    {
                                      showDialog(context: context, builder: (context) => AlertDialog(
                                        backgroundColor: AppColors.white,
                                        contentPadding: EdgeInsetsDirectional.zero,
                                        content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              Builder(builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    if(data.post!.body==null)
                                                    {
                                                      showToast(msg: 'This post doesn\'t have text to share', toastStates: ToastStates.error);
                                                    }
                                                    else
                                                    {
                                                      Share.share(data.post!.body!);
                                                      Navigator.pop(context);

                                                    }
                                                  },
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 20.w,
                                                      ),
                                                      Container(
                                                          width: 30.w,
                                                          height: 30.h,
                                                          decoration:
                                                          const BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: AppColors.white,
                                                          ),
                                                          child:  Center(
                                                              child: Icon(
                                                                Icons.share_outlined,
                                                                color: AppColors.primary,
                                                                size: 25.sp,
                                                              ))),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      const ResuableText(
                                                        text: 'Share Text',
                                                        color: AppColors.primary,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 14,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              GestureDetector(
                                                onTap: ()
                                                {
                                                  if(data.post!.image==null)
                                                  {
                                                    showToast(msg: 'This post doesn\'t have image to share', toastStates: ToastStates.error);
                                                  }
                                                  else
                                                  {
                                                    Share.shareUri(Uri.parse(data.post!.image!));
                                                    Navigator.pop(context);


                                                  }

                                                },
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 20.w,
                                                    ),
                                                    Container(
                                                        width: 30.w,
                                                        height: 30.h,
                                                        decoration:
                                                        const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: AppColors.white,
                                                        ),
                                                        child:  Center(
                                                            child: Icon(
                                                              Icons.share_outlined,
                                                              color: AppColors.primary,
                                                              size: 25.sp,
                                                            ))),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    const ResuableText(
                                                      color: AppColors.primary,
                                                      text: 'Share Image',
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 14,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 15.h,)

                                            ]

                                        ),
                                      ));
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
      },
      );
  },
),
);
  }
}
