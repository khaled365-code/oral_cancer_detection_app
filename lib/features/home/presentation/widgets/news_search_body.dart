import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/features/home/presentation/widgets/news_shimmer.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utilis/lotties_constants.dart';
import '../../data/models/news_model.dart';
import '../manager/search_news_cubit/search_news_cubit.dart';
import 'news_listview.dart';

class NewsSearchBody extends StatelessWidget {
  const NewsSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchNewsCubit>(context);
    return  BlocBuilder<SearchNewsCubit, SearchNewsState>(
      builder: (context, state) {
        if(state is SearchNewsSuccessState){
          return FutureBuilder<List<ArticleModel>>(
              future:searchCubit.newsList ,
              builder:(context,snapshot){
                if(snapshot.hasData){
                  return  NewsListView(newsList: snapshot.data!);
                }
                else if (snapshot.hasError){
                  return Center(child: Text("try later",style: AppTextStyles.font14,));
                }
                else{
                  //here shimmer should be applied
                  return NewsShimmer();
                }
              });
        }
        else if(state is SearchNewsFailureState){
          return Center(child:  Lottie.asset(AppLoties.noDataFoundLottie));
        }
        else if (state is SearchNewsLoadingState){
          return NewsShimmer();
        }
        else{
          return Center(child: Lottie.asset(AppLoties.searchNewsLottie));
        }
      },
    );
  }
}
