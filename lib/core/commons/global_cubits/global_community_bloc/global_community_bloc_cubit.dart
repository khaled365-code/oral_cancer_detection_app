import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../features/community/data/models/camera_posts_model.dart';
import '../../../../features/community/data/models/post_data_model.dart';
import '../../../utilis/image_constants.dart';

part 'global_community_bloc_state.dart';

class GlobalCommunityBloc extends Cubit<GlobalCommunityBlocState> {
  GlobalCommunityBloc() : super(GlobalCommunityBlocInitial());


  List<CameraPostsModedl>cameraPostsData=[
    CameraPostsModedl(image: ImageConstants.media1Image, isFixed: false),
    CameraPostsModedl(image: ImageConstants.media1Image, isFixed: true),
    CameraPostsModedl(image: ImageConstants.media3Image, isFixed: true),
    CameraPostsModedl(image: ImageConstants.media3Image, isFixed: true)


  ];

  List<PostDataModel>postsDataList=[
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),
    PostDataModel(postOwnerPhoto: ImageConstants.manCommentImage, owner: 'Martha Craig', userName: '@khale_mo', hours: 14, content: 'You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou', commentNumber: 28, loveNumber: 28, retweetNumber: 28),

  ];





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
