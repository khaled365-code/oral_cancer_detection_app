import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/features/home/data/models/news_model.dart';
import 'package:meta/meta.dart';
import '../services/news_services.dart';
part 'search_news_state.dart';

class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit() : super(SearchNewsInitial());

  TextEditingController searchController=TextEditingController();
   late Future<List<ArticleModel>> newsList;


   onSubmittedSearch(String data)async{
    try{
      emit(SearchNewsLoadingState());
      newsList=  NewsService().getNews(searchWord: data);
      List<ArticleModel> articles = await newsList;
      if(articles.isEmpty){
        emit(SearchNewsFailureState());
      }
      else{
        emit(SearchNewsSuccessState());
      }
    }
    catch(e){
      emit(SearchNewsFailureState());
      print(e);
    }
   }
}

