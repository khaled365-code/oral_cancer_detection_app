import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/home/data/models/for_you_article_data_model/for_you_article_data.dart';
import 'package:graduation_project/features/home/data/models/for_your_knowledge_model/for_your_knowledge_model.dart';
import 'package:graduation_project/features/home/presentation/cubits/initial_home_screen_cubit/initial_home_screen_cubit.dart';

class ForYouTopics extends StatelessWidget {
  const ForYouTopics(
      {super.key, required this.forYourKnowledgeModel, required this.currentIndex});

  final ForYourKnowledgeModel forYourKnowledgeModel;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitialHomeScreenCubit(),
      child: BlocBuilder<InitialHomeScreenCubit, InitialHomeScreenState>(
        builder: (context, state) {
          final initialHomeCubit=BlocProvider.of<InitialHomeScreenCubit>(context);
          return GestureDetector(
            onTap: ()
            {
              navigate(context: context, route: Routes.forYouArticle,arg: initialHomeCubit.forYouArticleDataModel[currentIndex]);
            },
            child: Container(
                width: 270.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                    boxShadow:
                    [
                      BoxShadow(
                        color: AppColors.cEAEAEA,
                        blurRadius: 5,
                        spreadRadius: 3,
                      )
                    ]

                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 10.w, top: 10.w, end: 10.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        SizedBox(width: 10.h,),
                        ResuableText(
                          text: forYourKnowledgeModel.title,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c98D3E9,
                        ),
                        SizedBox(width: 5.h,),
                        ResuableText(
                          text: forYourKnowledgeModel.description,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),

                      ]

                  ),
                )),
          );
        },
      ),
    );
  }
}
