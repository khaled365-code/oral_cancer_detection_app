import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/features/community/data/models/TemporaryPostDetailsModel.dart';
import 'package:graduation_project/features/community/data/models/get_comments_model/Message.dart';
import 'package:graduation_project/features/community/data/models/new_all_posts_model/NewAllPostsModel.dart';
import 'package:graduation_project/features/community/data/models/one_post_model/OnePostModel.dart';
import 'package:graduation_project/features/community/data/models/search_model/SearchPostModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../features/community/data/models/camera_posts_model.dart';
import '../../../../features/community/data/models/post_data_model.dart';
import '../../../../features/community/data/repos/community_repo_implementation.dart';
import '../../../utilis/image_constants.dart';

part 'global_community_bloc_state.dart';

class GlobalCommunityBloc extends Cubit<GlobalCommunityBlocState> {


  GlobalCommunityBloc({required this.communityRepoImplementation}) : super(GlobalCommunityBlocInitial());


  final CommunityRepoImplementation communityRepoImplementation;


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





















  // get all posts logic
  getAllPostsFun() async
  {
    emit(GetAllPostsLoadingState());
    final  response= await communityRepoImplementation.
    getAllPosts(token: CacheHelper().getData(key: ApiKeys.token));

    response.fold((error) => emit(GetAllPostsFailureState(errorMessage: error)),
            (successModel) => emit(GetAllPostsSuccessState(postDetailsModel: successModel)));



  }


  // add like logic
  addLikeCount({required num postId}) async
  {
    emit(AddLikeLoadingState());
    final response=await communityRepoImplementation.addLikeForPost(
        postId: postId,
        userId: int.parse(CacheHelper().getData(key: ApiKeys.id)),
        token: CacheHelper().getData(key: ApiKeys.token));
    response.fold((error) => emit(AddLikeFailureState(errorMessage: error)),
            (success) => emit(AddLikeSuccessState(successMessage: success)));


  }



  // add comment logic
  TextEditingController addCommentControllerField=TextEditingController();
  TextEditingController addCommentforScreenController=TextEditingController();

  addComment({required num postId,required String comment}) async
  {
    emit(AddCommentLoadingState());
    final response=await communityRepoImplementation.
    addComment(
        postId: postId,
        userId: CacheHelper().getData(key: ApiKeys.id),
        comment: comment,
        token: CacheHelper().getData(key: ApiKeys.token));

    response.fold((error) => emit(AddCommentFailureState(errorMessage: error)),
            (success) => emit(AddCommentSuccessState(successMessage: success)));


  }
  
  
  



  // add Post Logic

  TextEditingController postTitleController=TextEditingController();
  TextEditingController bodyController=TextEditingController();
  XFile? addPostImage;
  addImageFun({required XFile comeImage})
  {
    addPostImage=comeImage;
    emit(ChangeAddPostPictureState());
  }
  addNewPost({required String body,required String title}) async
  {
    emit(AddPostLoadingState());
    final response=await communityRepoImplementation.uploadPost(
          token: CacheHelper().getData(key: ApiKeys.token),
          userId: int.parse(CacheHelper().getData(key: ApiKeys.id)),
          body: body,
          image: addPostImage!=null? await uploadImageToAPI(addPostImage!):null,
          title: title,
        );

    response.fold(
            (error) => emit(AddPostFailureState(errorMessage: error)),
            (success) => emit(AddPostSuccessState(successMessage: success)));

  }


  //saerch for posts logic

  TextEditingController searchFieldController=TextEditingController();
  searchForPosts({required String searchContent}) async
  {
    emit(SearchForPostsLoadingState());
    final response=await communityRepoImplementation.searchForPosts(
      token: CacheHelper().getData(key: ApiKeys.token),
      searchContent: searchContent,
    );

    response.fold((error) => emit(SearchForPostsFailureState(errorMessage: error)),
            (success) => emit(SearchForPostsSuccessState(searchModel: success)));


  }


  // get all comments logic

  getAllComments({required num postId}) async
  {
    emit(GetAllCommentsLoadingState());
   final response= await communityRepoImplementation.getAllComments(
        postId: postId,
        userId: CacheHelper().getData(key: ApiKeys.id),
        token: CacheHelper().getData(key: ApiKeys.token));


    response.fold(
            (error) => emit(GetAllCommentsFailureState(errorMessage: error)),
            (Success) => emit(GetAllCommentsSuccessState(commentsModel: Success)));
  }









}
