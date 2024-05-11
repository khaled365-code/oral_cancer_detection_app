import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/features/community/data/models/camera_posts_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';

class CmaeraPostContainer extends StatelessWidget {

  final CameraPostsModedl cameraPostsModedl;

  const CmaeraPostContainer({
    super.key, required this.cameraPostsModedl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCommunityBloc, GlobalCommunityBlocState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final communityBloc= BlocProvider.of<GlobalCommunityBloc>(context);
        return cameraPostsModedl.isFixed == false ?
        Center(
          child: Container(
            width: 78.w,
            height: 78.h,
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.cCED5DC,
                    width: 1.w
                ),
                borderRadius: BorderRadius.circular(16),
                image: communityBloc.addPostImage!=null? DecorationImage(
                    image: FileImage(File(communityBloc.addPostImage!.path)),fit: BoxFit.cover
                ):DecorationImage(
                    image: AssetImage( ImageConstants.cameraBlueImage))
            ),
          )) :

        Container(
          width: 78.w,
          height: 78.h,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.cCED5DC,
                width: 1.w
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(cameraPostsModedl.image, fit: BoxFit.cover,),
        );
      },
    );
  }
}