import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/community/data/models/search_model/SearchPostModel.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/api_keys.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../data/repos/community_repo_implementation.dart';

part 'search_for_posts_state.dart';

class SearchForPostsCubit extends Cubit<SearchForPostsState> {
  SearchForPostsCubit({required this.communityRepoImplementation}) : super(SearchForPostsInitial());



  final CommunityRepoImplementation communityRepoImplementation;


  //saerch for posts logic

  getPostsNumber({required int postsNumber})
  {
    return postsNumber;
  }
  TextEditingController searchFieldController=TextEditingController();
  searchForPosts({required String searchContent}) async
  {
    emit(SearchForPostsLoadingState());
    final response=await communityRepoImplementation.searchForPosts(
      token: CacheHelper().getData(key: ApiKeys.token),
      searchContent: searchContent,
    );

    var postsNum = getPostsNumber(postsNumber: response.data!.length);

    if (postsNum == 0)
    {
      emit(SearchForPostsFailureState());
    } else
    {
      emit(SearchForPostsSuccessState(searchModel: response));
    }



  }



}
