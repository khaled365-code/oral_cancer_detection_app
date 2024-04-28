import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/community/data/repos/community_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({required this.communityRepoImplementation}) : super(AddPostInitial());

  final CommunityRepoImplementation communityRepoImplementation;

  TextEditingController postContentController=TextEditingController();

  addNewPost() async
  {
    emit(AddPostLoadingState());
   final response=await communityRepoImplementation.uploadPost(
        title: 'what is xmlfile',
        body: postContentController.text,
        id: int.parse(CacheHelper().getData(key: ApiKeys.id)),
        token: CacheHelper().getData(key: ApiKeys.token));

    response.fold(
            (error) => emit(AddPostFailureState(errorMessage: error)),
            (success) => emit(AddPostSuccessState(successMessage: success)));


  }

}
