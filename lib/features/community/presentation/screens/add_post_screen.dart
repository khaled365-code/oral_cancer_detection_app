import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/api/api_keys.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/utilis/image_constants.dart';
import '../widgets/camera_post_container.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
      listener: (context, state) {
        if(state is AddPostSuccessState)
          {
            showToast(msg: 'Post Created Successfully',toastStates: ToastStates.success);
          }
        else if(state is AddPostFailureState )
          {
            showToast(msg: state.errorMessage,toastStates: ToastStates.error);

          }
      },
      builder: (context, state)
      {
        final communityBloc = BlocProvider.of<GlobalCommunityBloc>(context);
       return Scaffold(
                body: Column(
                  children: [
                    SizedBox(height: 50.h,),
                    state is AddPostLoadingState ?
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40.h,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 20.w),
                            child: Text(
                              'Cancel',
                              style: AppKhaledStyles.textStyle(
                                color: AppColors.c4C9EEB,
                                size: 16,
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
                    ) :
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
                                communityBloc.addPostBodyController.clear();
                                communityBloc.addPostImage=null;
                                communityBloc.getAllPostsFun();
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: AppKhaledStyles.textStyle(
                                  color: AppColors.c4C9EEB,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () async
                            {
                              if(communityBloc.addPostBodyController.text.isEmpty&&communityBloc.addPostImage==null)
                                {
                                  showToast(msg: 'You should add a post or an image to continue', toastStates: ToastStates.error);
                                }
                              else
                                {
                                  await communityBloc.addNewPost(body: communityBloc.addPostBodyController.text);
                                  communityBloc.addPostBodyController.clear();
                                  communityBloc.addPostImage=null;
                                }

                            },
                            child: Container(
                              width: 67.w,
                              height: 34.h,
                              decoration: BoxDecoration(
                                color: AppColors.cB9DCF7,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Post',
                                  style: AppKhaledStyles.textStyle(
                                    color: AppColors.white,
                                    size: 13,
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

                    Padding(
                      padding:  EdgeInsetsDirectional.only(start: 20.w),
                      child: Row(
                        children:
                        [
                          Container(
                            width: 55.w,
                            height: 55.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage (
                                    image: CachedNetworkImageProvider(CacheHelper().getData(key: ApiKeys.profile_photo_url)),
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
                                      controller: communityBloc.addPostBodyController,
                                      onFieldSubmitted: (value) async
                                      {

                                        if(communityBloc.addPostBodyController.text.isEmpty&&communityBloc.addPostImage==null)
                                        {
                                          showToast(msg: 'You should add a post or an image to continue', toastStates: ToastStates.error);
                                        }
                                       else
                                         {
                                           await communityBloc.addNewPost(body: communityBloc.addPostBodyController.text);
                                           communityBloc.addPostBodyController.clear();
                                           communityBloc.addPostImage=null;
                                           communityBloc.getAllPostsFun();
                                           Navigator.pop(context);
                                         }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'What\'s happening ?',
                                          hintTextDirection: TextDirection.ltr,
                                          hintStyle: AppKhaledStyles.textStyle(
                                            color: AppColors.c687684,
                                            size: 14,
                                          )

                                      ),
                                    ),
                                  ],
                                ),
                              ))

                        ],
                      ),
                    ),
                    Spacer(),






                    state is AddPostLoadingState?
                    Shimmer.fromColors(
                      baseColor: AppColors.cE1E1E1,
                      highlightColor: AppColors.primary,
                      child: Padding(
                        padding:  EdgeInsets.only(top: 30.h),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 94.h,
                          child: ListView.separated(
                              padding: EdgeInsetsDirectional.all(8.w),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  CmaeraPostContainer(
                                    cameraPostsModedl: communityBloc
                                        .cameraPostsData[index],

                                  ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 12.w),
                              itemCount: 4),
                        ),
                      ),
                    ):
                    Padding(
                      padding:  EdgeInsets.only(top: 30.h),
                      child: Container(width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 94.h,
                        child: ListView.separated(
                            padding: EdgeInsetsDirectional.all(8.w),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                GestureDetector(
                                  onTap: ()
                                  {
                                    if(communityBloc.cameraPostsData[index].isFixed==false)
                                      {
                                        imagePick(imageSource: ImageSource.camera).
                                        then((value) => communityBloc.addImageFun(comeImage: value!));

                                      }
                                  },
                                  child: CmaeraPostContainer(
                                    cameraPostsModedl: communityBloc
                                        .cameraPostsData[index],

                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 12.w),
                            itemCount: 4),
                      ),
                    ),

                    state is AddPostLoadingState?
                    Shimmer.fromColors(
                        baseColor: AppColors.cE1E1E1,
                        highlightColor: AppColors.primary,
                        child:Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40.h,
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: AppColors.cEFF0F3,
                                    width: 1.5.w
                                ),

                              )
                          ),
                          child: Row(
                            children:
                            [
                              SizedBox(width: 10.w,),
                              SvgPicture.asset(ImageConstants.addImageTwitterIcon,color: AppColors.primary,width: 20.w,height: 20.h,),
                              SizedBox(width: 15.w,),
                              Icon(Icons.delete_outline_sharp,color: AppColors.primary,size: 25.w,),
                              Spacer(),
                              SizedBox(
                                  width: 22.w,
                                  height: 22.h,
                                  child: SvgPicture.asset(ImageConstants.earthSolidIcon,color: AppColors.primary,)),
                              SizedBox(width: 10.w,),
                              ResuableText(
                                text: 'Public',
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 10.w,),
                            ],
                          ),
                        ),
                      ):
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: AppColors.cEFF0F3,
                            width: 1.5.w
                          ),

                        )
                      ),
                      child: Row(
                        children:
                        [
                          SizedBox(width: 15.w,),
                          GestureDetector(
                              onTap: ()
                              {
                                imagePick(imageSource: ImageSource.gallery).
                                then((value) => communityBloc.addImageFun(comeImage: value!));
                              },
                              child: SvgPicture.asset(ImageConstants.addImageTwitterIcon,color: AppColors.primary,width: 20.w,height: 20.h,)),
                          SizedBox(width: 15.w,),
                          GestureDetector(
                            onTap: ()
                              {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.warning,
                                  text: 'You want to delete this photo ?',
                                  confirmBtnText: 'Yes',
                                  cancelBtnText: 'No',
                                  confirmBtnColor: AppColors.primary,
                                  showCancelBtn: true,
                                  onConfirmBtnTap: ()
                                  {
                                    communityBloc.deleteImageFun();
                                    Navigator.pop(context);
                                  },
                                  onCancelBtnTap: ()
                                  {
                                    Navigator.pop(context);
                                  },
                                  cancelBtnTextStyle: AppKhaledStyles.textStyle(
                                    size: 17,
                                    color: AppColors.cB4B4B4,
                                  ),
                                  confirmBtnTextStyle: AppKhaledStyles.textStyle(
                                    size: 17,
                                    color: AppColors.white,
                                  ),



                                );
                              },
                              child: Icon(Icons.delete_outline_sharp,color: AppColors.primary,size: 25.w,)),
                          Spacer(),
                          SizedBox(
                            width: 22.w,
                              height: 22.h,
                              child: SvgPicture.asset(ImageConstants.earthSolidIcon,color: AppColors.primary,)),
                          SizedBox(width: 10.w,),
                          ResuableText(
                            text: 'Public',
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10.w,),
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
/*

Scaffold(
                body: Column(
                  children: [
                    SizedBox(height: 50.h,),
                    state is AddPostLoadingState ?
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
                                communityBloc.getAllPostsFun();
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: AppKhaledStyles.textStyle(
                                  color: AppColors.c4C9EEB,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 10.w,
                            height: 10.w,
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(
                            width: 21.w,
                          ),
                        ],
                      ),
                    )
                        :Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40.h,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 20.w),
                            child: GestureDetector(
                              onTap: ()
                              {
                                communityBloc.postTitleController.clear();
                                communityBloc.bodyController.clear();
                                communityBloc.addPostImage=null;
                                communityBloc.getAllPostsFun();
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: AppKhaledStyles.textStyle(
                                  color: AppColors.c4C9EEB,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () async
                            {
                              await communityBloc.addNewPost(
                                  body: communityBloc.bodyController.text,
                                  title: communityBloc.postTitleController.text,);

                              communityBloc.postTitleController.clear();
                              communityBloc.bodyController.clear();
                              communityBloc.addPostImage=null;
                            },
                            child: Container(
                              width: 67.w,
                              height: 34.h,
                              decoration: BoxDecoration(
                                color: AppColors.cB9DCF7,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Post',
                                  style: AppKhaledStyles.textStyle(
                                    color: AppColors.white,
                                    size: 13,
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

                    State is AddPostLoadingState ?
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.w, top: 30.h, end: 20.w),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.cE1E1E1,
                        highlightColor: AppColors.primary,
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                  color: AppColors.primary
                              )
                          ),
                          child: TextFormField(
                            controller: communityBloc.postTitleController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Add Your Title here',
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                                hintStyle: AppKhaledStyles.textStyle(
                                    color: AppColors.c687684
                                )
                            ),
                          ),
                        ),
                      ),
                    ) :  // title
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 20.w,
                          top: 30.h,
                          end: 20.w),
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                                color: AppColors.primary
                            )
                        ),
                        child: TextFormField(
                          controller: communityBloc.postTitleController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Add Your Title here',
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                              hintStyle: AppKhaledStyles.textStyle(
                                  color: AppColors.c687684
                              )
                          ),
                        ),
                      ),
                    ),

                    state is AddPostLoadingState?
                    //body
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w,
                            top: 30.h,
                            end: 20.w),
                        child: Shimmer.fromColors(
                          baseColor: AppColors.cE1E1E1,
                          highlightColor: AppColors.primary,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                    color: AppColors.primary
                                )
                            ),
                            child: Expanded(
                              child: TextFormField(
                                controller: communityBloc.bodyController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Add Your Content here',
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                                    hintStyle: AppKhaledStyles.textStyle(
                                      color: AppColors.c687684,
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                        :
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w,
                            top: 30.h,
                            end: 20.w),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                  color: AppColors.primary
                              )
                          ),
                          child: Expanded(
                            child: TextFormField(
                              controller: communityBloc.bodyController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: 'Add Your Content here',
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                                  hintStyle: AppKhaledStyles.textStyle(
                                    color: AppColors.c687684,
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),),


                    state is AddPostLoadingState?
                    Shimmer.fromColors(
                      baseColor: AppColors.cE1E1E1,
                      highlightColor: AppColors.primary,
                      child: Padding(
                        padding:  EdgeInsets.only(top: 30.h),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 94.h,
                          child: ListView.separated(
                              padding: EdgeInsetsDirectional.all(8.w),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  CmaeraPostContainer(
                                    cameraPostsModedl: communityBloc
                                        .cameraPostsData[index],

                                  ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 12.w),
                              itemCount: 4),
                        ),
                      ),
                    ):
                    Padding(
                      padding:  EdgeInsets.only(top: 30.h),
                      child: Container(width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 94.h,
                        child: ListView.separated(
                            padding: EdgeInsetsDirectional.all(8.w),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                GestureDetector(
                                  onTap: ()
                                  {
                                    if(communityBloc.cameraPostsData[index].isFixed==false)
                                      {
                                        imagePick(imageSource: ImageSource.gallery).
                                        then((value) => communityBloc.addImageFun(comeImage: value!));

                                      }
                                  },
                                  child: CmaeraPostContainer(
                                    cameraPostsModedl: communityBloc
                                        .cameraPostsData[index],

                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 12.w),
                            itemCount: 4),
                      ),
                    ),

                    state is AddPostLoadingState?
                    Shimmer.fromColors(
                        baseColor: AppColors.cE1E1E1,
                        highlightColor: AppColors.primary,
                        child:Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40.h,
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: AppColors.cEFF0F3,
                                    width: 1.5.w
                                ),

                              )
                          ),
                          child: Row(
                            children:
                            [
                              SizedBox(width: 10.w,),
                              SvgPicture.asset(ImageConstants.addImageTwitterIcon,color: AppColors.primary,width: 20.w,height: 20.h,),
                              SizedBox(width: 15.w,),
                              SvgPicture.asset(ImageConstants.locationTwitterIcon,color: AppColors.primary,width: 20.w,height: 20.h,),
                              Spacer(),
                              SizedBox(
                                  width: 22.w,
                                  height: 22.h,
                                  child: SvgPicture.asset(ImageConstants.earthSolidIcon,color: AppColors.primary,)),
                              SizedBox(width: 10.w,),
                              ResuableText(
                                text: 'Public',
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 10.w,),
                            ],
                          ),
                        ),
                      ):
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: AppColors.cEFF0F3,
                            width: 1.5.w
                          ),

                        )
                      ),
                      child: Row(
                        children:
                        [
                          SizedBox(width: 15.w,),
                          GestureDetector(
                              onTap: ()
                              {
                                imagePick(imageSource: ImageSource.gallery).
                                then((value) => communityBloc.addImageFun(comeImage: value!));
                              },
                              child: SvgPicture.asset(ImageConstants.addImageTwitterIcon,color: AppColors.primary,width: 20.w,height: 20.h,)),
                          SizedBox(width: 15.w,),
                          SvgPicture.asset(ImageConstants.locationTwitterIcon,color: AppColors.primary,width: 20.w,height: 20.h,),
                          Spacer(),
                          SizedBox(
                            width: 22.w,
                              height: 22.h,
                              child: SvgPicture.asset(ImageConstants.earthSolidIcon,color: AppColors.primary,)),
                          SizedBox(width: 10.w,),
                          ResuableText(
                            text: 'Public',
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10.w,),
                        ],
                      ),
                    ),

                  ],
                ),
            )
 */



