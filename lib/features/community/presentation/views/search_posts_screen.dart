import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/commons/global_cubits/global_community_bloc/global_community_bloc_cubit.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/lotties_constants.dart';
import 'package:graduation_project/features/community/cubits/search_for_posts_cubit/search_for_posts_cubit.dart';
import 'package:graduation_project/features/community/presentation/widgets/serach_post_result_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/utilis/fontweight_helper.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/widgets/resuable_text.dart';
import '../widgets/line_widget.dart';
import '../widgets/no_search_result_widget.dart';

class SearchPostsScreen extends StatelessWidget {
  const SearchPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchForPostsCubit, SearchForPostsState>(
      listener: (context, state) {
        if(state is SearchForPostsSuccessState)
        {
          showToast(msg: 'Matching Data Successfully Loaded',toastStates: ToastStates.success);
        }
        else if(state is SearchForPostsFailureState )
        {
          showToast(msg: 'No Matching Posts',toastStates: ToastStates.error);

        }
      },
      builder: (context, state) {
        final searchPostsCubit = BlocProvider.of<SearchForPostsCubit>(context);
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                state is SearchForPostsLoadingState ?
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    height: 40.h,
                    child: Row(
                      children:
                      [
                       Spacer(),
                        GestureDetector(
                            onTap: ()
                            {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.primary,
                              size: 15.sp,
                            )),
                        SizedBox(width: 10.w,),
                        Container(
                          height: 32.h,
                          width: MediaQuery.of(context).size.width*0.75,
                          decoration: BoxDecoration(
                              color: AppColors.cE7ECF0,
                              borderRadius: BorderRadius.circular(4.r)
                          ),
                          child: Expanded(
                            child: TextField(
                              controller: searchPostsCubit.searchFieldController,
                              onSubmitted: (value)
                              {

                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsetsDirectional.only(
                                    start: 20.w, bottom: 10.h,),
                                  hintText: 'Search Posts',
                                  hintStyle: AppKhaledStyles.textStyle(
                                    color: AppColors.cAFB8C1,
                                    size: 15,
                                    weight: FontWeightHelper.regular
                                  )
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: ()
                            {

                            },
                            child: Image.asset(ImageConstants.communitySettingsImage,color: AppColors.primary)),
                        SizedBox(width: 10.w,),



                      ],
                    ),
                  ),
                ):
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    height: 40.h,
                    child: Row(
                      children:
                      [
                        Spacer(),
                        GestureDetector(
                            onTap: ()
                            {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.primary,
                              size: 15.sp,
                            )),
                        SizedBox(width: 10.w,),
                        Container(
                          height: 32.h,
                          width: MediaQuery.of(context).size.width*0.75,
                          decoration: BoxDecoration(
                              color: AppColors.cE7ECF0,
                              borderRadius: BorderRadius.circular(4.r)
                          ),
                          child: Expanded(
                            child: TextField(
                              controller: searchPostsCubit.searchFieldController,
                              onSubmitted: (value) async
                              {
                                await searchPostsCubit.searchForPosts(
                                    searchContent: value);
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsetsDirectional.only(
                                    start: 20.w, bottom: 10.h),
                                  hintText: 'Search Posts',
                                  hintStyle: AppKhaledStyles.textStyle(
                                      color: AppColors.cAFB8C1,
                                      size: 15,
                                      weight: FontWeightHelper.regular
                                  )
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: ()
                            {
                              // navigate(context: context, route: Routes.noPostsScreen);
                            },
                            child: Image.asset(
                                ImageConstants.communitySettingsImage,color: AppColors.primary,)),
                        SizedBox(width: 10.w,),


                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 6.h,)),
                state is SearchForPostsSuccessState?
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) => SearchResultWidget(
                            maxWidth: MediaQuery.of(context).size.width,
                              serachModel: state.searchModel.data![index]),
                      childCount: state.searchModel.data!.length,
                    ),
                ):
                state is SearchForPostsLoadingState ?
                SliverToBoxAdapter(
                    child:
                    Container(
                      color: AppColors.cE7ECF0,
                        child: Lottie.asset(AppLoties.LoadingMedicalRecLottie,)))
                        :SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children:
                    [
                      LineWidget(),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w, top: 10.h),
                        child: ResuableText(
                          text: 'Posts for you',
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                  
                        ),
                      ),
                      SizedBox(height: 12.3.h,),
                      LineWidget(),
                      NoSearchResultWidget(),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: Container(
                    color: AppColors.cE7ECF0,
                  ),
                )
              ],
            ),
          ),





          floatingActionButton: GestureDetector(
            onTap: () async {

             await searchPostsCubit.searchForPosts(searchContent: searchPostsCubit.searchFieldController.text);
            },
            child: Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle
                ), child: Icon(FontAwesomeIcons.magnifyingGlass,color: AppColors.white,)),
          ),
        );
      },
    );
  }
}

