part of 'search_for_posts_cubit.dart';

@immutable
abstract class SearchForPostsState {}

class SearchForPostsInitial extends SearchForPostsState {}


class SearchForPostsLoadingState extends SearchForPostsState {}

class SearchForPostsSuccessState extends SearchForPostsState {

  final SearchPostModel searchModel;

  SearchForPostsSuccessState({required this.searchModel});


}


class SearchForPostsFailureState extends SearchForPostsState {}
