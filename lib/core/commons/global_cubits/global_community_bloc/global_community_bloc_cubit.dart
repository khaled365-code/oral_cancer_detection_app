import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/community/data/models/TemporaryPostDetailsModel.dart';
import 'package:graduation_project/features/community/data/models/post_details_mode;.dart';
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





}
