import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/custom_refresh_indicator.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/home/data/repos/home_repo_implementation.dart';
import 'package:graduation_project/features/home/presentation/cubits/get_top_medical_news_cubit/get_top_medical_news_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubits/initial_home_screen_cubit/initial_home_screen_cubit.dart';
import 'package:graduation_project/features/home/presentation/widgets/for_you_topics.dart';
import 'package:graduation_project/features/home/presentation/widgets/medical_news_Loading_container.dart';
import 'package:graduation_project/features/home/presentation/widgets/slider_content.dart';
import 'package:graduation_project/features/home/presentation/widgets/top_news_container.dart';

class InitialHomeScreen extends StatelessWidget {
  const InitialHomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => GetTopMedicalNewsCubit(homeRepoImplementation: HomeRepoImplementation(apiConsumer: DioConsumer(dio: Dio(),isTopHeadlinesNews: true, isTextModel: false, isImageModel: false)))..getTopMedicalNews(),
),
    BlocProvider(
      create: (context) => InitialHomeScreenCubit(),
    ),
  ],
  child: BlocBuilder<InitialHomeScreenCubit, InitialHomeScreenState>(
  builder: (context, state) {
    return BlocConsumer<GetTopMedicalNewsCubit, GetTopMedicalNewsState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    final initialHomeCubit=BlocProvider.of<InitialHomeScreenCubit>(context);
    final getTopMedicalNewsCubit=BlocProvider.of<GetTopMedicalNewsCubit>(context);
    final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    return Scaffold(
        body: RefreshIndicator(
          edgeOffset: 1,
          key: refreshIndicatorKey,
          onRefresh: () async
          {
            await getTopMedicalNewsCubit.getTopMedicalNews();
          },
          child: CustomScrollView(
            slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 16.w, top: 16.h, end: 16.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: CarouselSlider(
                          carouselController: initialHomeCubit.buttonCarouselController,
                          options: CarouselOptions(
                            enableInfiniteScroll: true,
                            aspectRatio: 16 /13,
                            viewportFraction: 1,
                            initialPage: 0,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            scrollDirection: Axis.horizontal,
                            autoPlayCurve: Curves.easeInOut,
                          ),
                          items: [0, 1, 2, 3, 4].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return SliderContent(
                                  carouselDataList: initialHomeCubit.carouselDataList,
                                  carouselDataModel: initialHomeCubit.carouselDataList[i],
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 10.h,)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 16.w),
                      child: ResuableText(
                        text: 'For Your Knowledge',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 10.h,)),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 130.h,
                      child: ListView.separated(
                          clipBehavior: Clip.none,
                          padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => ForYouTopics(
                            currentIndex: index,
                            forYourKnowledgeModel: initialHomeCubit.forYourKnowledgeList[index],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10.h,),
                          itemCount: initialHomeCubit.forYourKnowledgeList.length),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h,)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 16.w),
                      child: ResuableText(
                        text: 'Top News',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 10.h,)),
                  state is GetTopMedicalNewsLoadingState ?
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) => Padding(
                        padding:  EdgeInsetsDirectional.only(start: 16.w,end: 16.w),
                        child: MedicalNewsLoadingContainer(),
                      ),
                        childCount: 5
                      )):state is GetTopMedicalNewsSuccessState ?
                  SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                          (context, index) => Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        start: 16.w, end: 16.w),
                                                child: TopNewsContainer(
                                                  topArticles: state
                                                      .topHeadlinesMedicalModel
                                                      .articles![index],
                                                ),
                                              ),
                                          childCount: state
                                              .topHeadlinesMedicalModel
                                              .articles!
                                              .length)) :
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) => Padding(
                        padding:  EdgeInsetsDirectional.only(start: 16.w,end: 16.w),
                        child: MedicalNewsLoadingContainer(),
                      ),
                          childCount: 5
                      )),
                ],
              ),
        ),
      );
  },
);
  },
),
);
  }
}
