import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';

import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/image_constants.dart';

class PostDetailsWidget extends StatelessWidget {
  const PostDetailsWidget({super.key});




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final communityBloc=BlocProvider.of<GlobalCommunityBloc>(context);
        return Container(
          width: 414.w,
          height: 342.h,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border(
                  top: BorderSide(
                      color: AppColors.cEFF0F3
                  )
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              SizedBox(height: 15.h,),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.w),
                child: Row(
                  children: [
                    Container(
                      width: 55.w,
                      height: 55.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle
                      ),
                      child: Image.asset(
                        ImageConstants.manCommentImage, fit: BoxFit.contain,),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Martha Craig', style: AppKhaledStyles.textStyle(
                            color: AppColors.black,
                            weight: FontWeight.w700,
                            size: 13,
                          ),),
                          SizedBox(height: 3.h,),
                          Text('@khaled_mo', style: AppKhaledStyles.textStyle(
                            color: AppColors.c687684,
                            weight: FontWeight.w500,
                            size: 11,
                          ),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.w, top: 23.h),
                  child: Text(
                    'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou',
                    style: AppKhaledStyles.textStyle(
                        weight: FontWeight.w400,
                        size: 14,
                        color: AppColors.black
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.w, top: 35.h),
                child: Row(
                  children: [
                    Text('09:28', style: AppKhaledStyles.textStyle(
                      color: AppColors.c687684,
                      weight: FontWeight.w400,
                      size: 13,
                    ),),
                    SizedBox(width: 10.w,),
                    Text('2/21/20', style: AppKhaledStyles.textStyle(
                      color: AppColors.c687684,
                      weight: FontWeight.w400,
                      size: 13,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 14.w),
                child: Container(
                  height: 1.h,
                  color: AppColors.cEFF0F3,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 13.h, start: 20.w),
                child: Row(
                  children: [
                    Text('13', style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight: FontWeight.w600,
                      size: 13,
                    ),),
                    SizedBox(width: 5.w,),
                    Text('Likes', style: AppKhaledStyles.textStyle(
                      color: AppColors.c687684,
                      weight: FontWeight.w400,
                      size: 13,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 12.h,),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 14.w),
                child: Container(
                  height: 1.h,
                  color: AppColors.cEFF0F3,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 13.h, start: 58.w),
                child: Row(
                  children:
                  [
                    GestureDetector(child: Image.asset(ImageConstants.commentImage)),
                    Spacer(),
                    GestureDetector(
                      onTap: ()
                        {

                        },
                        child: Image.asset(ImageConstants.heartImage)),
                    Spacer(),
                    GestureDetector(
                      onTap: ()
                        {

                        },
                        child: Image.asset(ImageConstants.retweetImage)),
                    SizedBox(width: 60.w,),
                  ],
                ),
              ),
              SizedBox(height: 13.h),
              LineWidget(),

            ],
          ),
        );
      },
    );
  }
}
