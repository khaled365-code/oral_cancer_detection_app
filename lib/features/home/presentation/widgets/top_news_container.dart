



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/home/data/models/top_headlines_news_medical_model/Articles.dart';

class TopNewsContainer extends StatelessWidget {
  const TopNewsContainer({super.key, required this.topArticles});

  final TopArticles topArticles;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        GestureDetector(
          onTap: ()
          {
            navigate(context: context, route: Routes.completeNewsArticle,arg: topArticles);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  SizedBox(
                      height: 150.h,
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                          imageUrl: topArticles.urlToImage!=null? topArticles.urlToImage:'https://clipground.com/images/no-image-png-5.jpg')),

                  SizedBox(height: 10.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w),
                    child: ResuableText(
                      text: topArticles.title??'No Title Available',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ResuableText(
                      text: topArticles.description??'No Description Available',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.c232323,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 20.h,)



                ]
            ),
          ),
        ),
        SizedBox(height: 30.h,)

      ],
    );
  }
}
