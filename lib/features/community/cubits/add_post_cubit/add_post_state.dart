part of 'add_post_cubit.dart';

@immutable
abstract class AddPostState {}

class AddPostInitial extends AddPostState {}

class AddPostLoadingState extends AddPostState {}
class AddPostFailureState extends AddPostState {

  final String errorMessage;
  AddPostFailureState({required this.errorMessage});
}
class AddPostSuccessState extends AddPostState {
  final String successMessage;
  AddPostSuccessState({required this.successMessage});

}

