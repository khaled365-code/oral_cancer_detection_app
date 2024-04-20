import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:meta/meta.dart';

import '../data/models/camera_posts_model.dart';

part 'community_bloc_state.dart';

class CommunityBlocCubit extends Cubit<CommunityBlocState> {
  CommunityBlocCubit() : super(CommunityBlocInitial());

  List<CameraPostsModedl>cameraPostsData=[
    CameraPostsModedl(image: ImageConstants.media1Image, isFixed: false),
    CameraPostsModedl(image: ImageConstants.media1Image, isFixed: true),
    CameraPostsModedl(image: ImageConstants.media3Image, isFixed: true),
    CameraPostsModedl(image: ImageConstants.media3Image, isFixed: true)


  ];




}
