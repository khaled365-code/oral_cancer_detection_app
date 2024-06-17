import 'package:dio/dio.dart';
import '../../../data/models/news_model.dart';

class NewsService{
  final  dio = Dio();

  Future<List<ArticleModel>> getNews({String? searchWord}) async {
    String baseUrl='';
    if(searchWord==null){
       baseUrl='https://newsapi.org/v2/top-headlines?country=us&apiKey=4f211e4813f048128ac1f3993be38373&category=health';
    }
    else{
      baseUrl='https://newsapi.org/v2/top-headlines?country=us&apiKey=4f211e4813f048128ac1f3993be38373&category=health&q=$searchWord';
    }
    try {

    Response response = await dio.get(baseUrl);

      Map<String,dynamic> jsonData=response.data;

      List articles=jsonData['articles'];

      List<ArticleModel> articleList=[];

      for(var article in articles){
        ArticleModel articleModel=ArticleModel(image: article["urlToImage"],
            title: article["title"], subTitle: article["description"],url: article["url"]);

        articleList.add(articleModel);
      }
      return articleList;
    } on Exception catch (e) {
      print(e.toString());
      return [];

    }
  }

}