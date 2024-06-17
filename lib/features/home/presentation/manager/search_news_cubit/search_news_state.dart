part of 'search_news_cubit.dart';

@immutable
sealed class SearchNewsState {}

final class SearchNewsInitial extends SearchNewsState {}
final class SearchNewsLoadingState extends SearchNewsState {}
final class SearchNewsSuccessState extends SearchNewsState {}
final class SearchNewsFailureState extends SearchNewsState {}
