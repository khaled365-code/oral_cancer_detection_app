// import 'package:flutter/material.dart';
// import '../../data/models/news_model.dart';
// import '../manager/services/news_services.dart';
// import '../widgets/news_listview.dart';
//
// class MedicalNews extends StatefulWidget {
//
//   const MedicalNews({super.key,});
//
//   @override
//   State<MedicalNews> createState() => _MedicalNewsState();
// }
//
// class _MedicalNewsState extends State<MedicalNews> {
//   var futureList;
//
//   @override
//   void initState() {
//     futureList=NewsService().getNews();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//      body: FutureBuilder<List<ArticleModel>>(
//        future: futureList,
//        builder: (context,snapshot){
//          if(snapshot.hasData){
//           return NewsListView(newsList: snapshot.data!);
//          }
//          if(snapshot.hasError){
//            return const Text("try later");
//          }
//          else{
//            return const Center(child: CircularProgressIndicator());
//          }
//
//        },
//      )
//     );
//   }
// }
