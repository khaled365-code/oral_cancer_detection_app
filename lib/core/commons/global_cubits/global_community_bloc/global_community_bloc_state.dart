part of 'global_community_bloc_cubit.dart';

@immutable
abstract class GlobalCommunityBlocState {}

class GlobalCommunityBlocInitial extends GlobalCommunityBlocState {}

class ChangeHeartState extends GlobalCommunityBlocState {}

class ChangeRetweetShapeState extends GlobalCommunityBlocState {}



class GetAllPostsLoadingState extends GlobalCommunityBlocState {}


class GetAllPostsSuccessState extends GlobalCommunityBlocState {
  final  TemporaryPostDetailsModel postDetailsModel;

  GetAllPostsSuccessState({required this.postDetailsModel});


}

class GetAllPostsFailureState extends GlobalCommunityBlocState {
  final String errorMessage;

  GetAllPostsFailureState({required this.errorMessage});

}


class ConnectionCheckState extends GlobalCommunityBlocState {
  final bool isConnected;

  ConnectionCheckState({required this.isConnected});
}


