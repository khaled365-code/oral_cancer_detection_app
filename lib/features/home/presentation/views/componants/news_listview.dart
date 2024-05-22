import 'package:flutter/cupertino.dart';
import '../../../data/models/news_model.dart';
import 'news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key? key,required this.newsList}) : super(key: key);
  final List<ArticleModel> newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context,index){
        return News_tile(articleModel: newsList[index]);
      }
      ,
    );
  }
}
