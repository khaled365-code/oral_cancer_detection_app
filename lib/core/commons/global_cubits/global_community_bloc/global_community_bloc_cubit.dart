import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/features/community/data/models/Data.dart';
import 'package:graduation_project/features/community/data/models/TemporaryPostDetailsModel.dart';
import 'package:graduation_project/features/community/data/models/one_post_model/OnePostModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../features/community/data/models/camera_posts_model.dart';
import '../../../../features/community/data/models/post_data_model.dart';
import '../../../../features/community/data/repos/community_repo_implementation.dart';
import '../../../utilis/image_constants.dart';

part 'global_community_bloc_state.dart';

class GlobalCommunityBloc extends Cubit<GlobalCommunityBlocState> {


  GlobalCommunityBloc({required this.communityRepoImplementation}) : super(GlobalCommunityBlocInitial());


  final CommunityRepoImplementation communityRepoImplementation;

  getAllPostsFun() async
  {
    emit(GetAllPostsLoadingState());
    final response= await communityRepoImplementation.
    getAllPosts(token: CacheHelper().getData(key: ApiKeys.token));

    response.fold((error) => emit(GetAllPostsFailureState(errorMessage: error)),
            (successModel) => emit(GetAllPostsSuccessState(postDetailsModel: successModel)));



  }



  List<CameraPostsModedl>cameraPostsData=[
    CameraPostsModedl(image: ImageConstants.media1Image, isFixed: false),
    CameraPostsModedl(image: ImageConstants.media1Image, isFixed: true),
    CameraPostsModedl(image: ImageConstants.media3Image, isFixed: true),
    CameraPostsModedl(image: ImageConstants.media3Image, isFixed: true)


  ];

  List<PostDataModel>postsDataList=[
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Owner Name', userName: 'person@gmail.com', hours: 0, content: 'This text is an example of text that can be replaced in the same space, this text has been generated. This text is an example of text that can be replaced in the same space.', commentNumber: 0, loveNumber: 0, retweetNumber: 0),

  ];



  void checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isConnected = connectivityResult != ConnectivityResult.none;
    emit(ConnectionCheckState(isConnected: isConnected));
  }





  changeHeartFun(int index,List<PostDataModel>postsDataList)
  {

    postsDataList[index].heartIsActive=!postsDataList[index].heartIsActive;
    emit(ChangeHeartState());

  }

  changeRetweetFun(int index,List<PostDataModel>postsDataList)
  {


    postsDataList[index].retweetIsActive=!postsDataList[index].retweetIsActive;

    emit(ChangeRetweetShapeState());

  }

   bool postDetailHeartIsActive=false;
   bool postDetailsRetweetIsActive=false;


  changeHeartForSingle()
  {
    postDetailHeartIsActive=!postDetailHeartIsActive;
    emit(ChangeHeartState());
  }
  changeRetweetForSingle()
  {
    postDetailsRetweetIsActive=!postDetailsRetweetIsActive;
    emit(ChangeRetweetShapeState());
  }


  addLikeCount({required num postId,required num userId}) async
  {
    emit(AddLikeLoadingState());
    final response=await communityRepoImplementation.addLikeForPost(
        postId: postId,
        userId: userId,
        token: CacheHelper().getData(key: ApiKeys.token));
    response.fold((error) => emit(AddLikeFailureState(errorMessage: error)),
            (success) => emit(AddLikeSuccessState()));


  }

  addComment({required num postId,required num userId,required String comment}) async
  {
    emit(AddCommentLoadingState());
    final response=await communityRepoImplementation.
    addComment(
        postId: postId,
        userId: userId,
        comment: comment,
        token: CacheHelper().getData(key: ApiKeys.token));

    response.fold((error) => emit(AddCommentFailureState(errorMessage: error)),
            (success) => emit(AddLikeSuccessState()));


  }

  getOnePostDetails({required num postId}) async
  {

    emit(GetOnePostLoadingState());
    final response=await communityRepoImplementation.getOnePostDetails(
      token: CacheHelper().getData(key: ApiKeys.token),
      postId: postId,
    );

    response.fold((error) => emit(GetOnePostFailureState(errorMessage: error)),
            (success) => emit(GetOnePostSuccessState(onePostModel: success)));


  }

  TextEditingController postTitleController=TextEditingController();

  TextEditingController bodyController=TextEditingController();


  addNewPost({XFile? image,required String body,required String title}) async
  {
    emit(AddPostLoadingState());
    final response=await communityRepoImplementation.uploadPost(
      token: CacheHelper().getData(key: ApiKeys.token),
      userId: int.parse(CacheHelper().getData(key: ApiKeys.id)),
      body: body,
      title: title
    );
    response.fold(
            (error) => emit(AddPostFailureState(errorMessage: error)),
            (success) => emit(AddPostSuccessState(successMessage: success)));


  }








}
