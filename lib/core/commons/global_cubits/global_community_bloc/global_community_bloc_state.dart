part of 'global_community_bloc_cubit.dart';

@immutable
abstract class GlobalCommunityBlocState {}

class GlobalCommunityBlocInitial extends GlobalCommunityBlocState {}


class ChangeRetweetShapeState extends GlobalCommunityBlocState {}





class GetAllPostsLoadingState extends GlobalCommunityBlocState {}


class GetAllPostsSuccessState extends GlobalCommunityBlocState {
  final  NewAllPostsModel postDetailsModel;

  GetAllPostsSuccessState({required this.postDetailsModel});


}

class GetAllPostsFailureState extends GlobalCommunityBlocState {
  final String errorMessage;

  GetAllPostsFailureState({required this.errorMessage});

}


class AddLikeLoadingState extends GlobalCommunityBlocState {}

class AddLikeSuccessState extends GlobalCommunityBlocState {

  final String successMessage;

  AddLikeSuccessState({required this.successMessage});

}

class AddLikeFailureState extends GlobalCommunityBlocState {
  final String errorMessage;

  AddLikeFailureState({required this.errorMessage});

}


class AddCommentLoadingState extends GlobalCommunityBlocState {}

class AddCommentSuccessState extends GlobalCommunityBlocState {
  final String successMessage;

  AddCommentSuccessState({required this.successMessage});
}

class AddCommentFailureState extends GlobalCommunityBlocState {

  final String errorMessage;

  AddCommentFailureState({required this.errorMessage});

}


class AddPostLoadingState extends GlobalCommunityBlocState {}

class AddPostSuccessState extends GlobalCommunityBlocState {

  final String successMessage;

  AddPostSuccessState({required this.successMessage});

}
class AddPostFailureState extends GlobalCommunityBlocState {

  final String errorMessage;

  AddPostFailureState({required this.errorMessage});
}




class ChangeAddPostPictureState extends GlobalCommunityBlocState {}

class AddPostPictureToNullState extends GlobalCommunityBlocState {}



class GetAllCommentsLoadingState extends GlobalCommunityBlocState {}


class GetAllCommentsSuccessState extends GlobalCommunityBlocState {

  final Message commentsModel;
  GetAllCommentsSuccessState({required this.commentsModel});
}




class GetAllCommentsFailureState extends GlobalCommunityBlocState {

  final String errorMessage;
  GetAllCommentsFailureState({required this.errorMessage});
}













