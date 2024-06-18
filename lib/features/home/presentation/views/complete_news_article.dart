

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_khaled_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/home/data/models/top_headlines_news_medical_model/Articles.dart';

class CompleteNewsArticle extends StatelessWidget {
  const CompleteNewsArticle({super.key});

  @override
  Widget build(BuildContext context) {
    final recievedData=ModalRoute.of(context)!.settings.arguments as TopArticles;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: ()
            {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.primary,size: 20,)),
        title: ResuableText(
          text: recievedData.title??'',
          color: AppColors.black,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        actions:
        [
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 5.w),
            child: GestureDetector(
              onTap: ()
              {

              },
              child: SizedBox(
                  width: 20.w,
                  height: 30.w,
                  child: Image.asset(ImageConstants.shareImage,color: AppColors.primary,)),
            ),
          ),
          SizedBox(width: 15.w,),
          Padding(
            padding:  EdgeInsetsDirectional.only(end: 15.w),
            child: GestureDetector(
              onTap: ()
              {

              },
              child: SizedBox(
                  width: 20.w,
                  height: 30.w,
                  child: Icon(FontAwesomeIcons.bookmark,size: 18.sp,color: AppColors.primary,)),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
                height: 200.h,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: recievedData.urlToImage??'https://clipground.com/images/no-image-png-5.jpg',fit: BoxFit.fill,)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsetsDirectional.only(start: 10.w,top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  recievedData.title!=null?
                  ResuableText(text: recievedData.title??'',
                      color: AppColors.c232323,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      maxLines: 5):SizedBox.shrink(),
                  SizedBox(height: 10.h,),
                  Row(
                    children:
                    [
                      recievedData.author!=null?
                     ResuableText(
                       text: 'By ${recievedData.author.split(',')[0]}',
                       color: AppColors.cCFCFCF,
                       fontSize: 12,
                     ):SizedBox.shrink(),
                      SizedBox(width: 5.w,),
                      recievedData.publishedAt!=null?
                      ResuableText(
                        text: '${DateTime.parse(recievedData.publishedAt!).day}/${DateTime.parse(recievedData.publishedAt!).month}/${DateTime.parse(recievedData.publishedAt!).year}',
                        color: AppColors.cCFCFCF,
                        fontSize: 12,
                      ):SizedBox.shrink(),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  recievedData.content!=null?
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 10.w),
                    child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: recievedData.content!,
                                style: AppKhaledStyles.textStyle(
                                  color: AppColors.c4B4B4B,
                                  size: 13,
                                  weight: FontWeight.w400
                                )),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async
                                  {
                                    launchInAppWithBrowserOptions(url: Uri.parse(recievedData.url!));
                                  },
                                text: '\nShow More',
                                style: AppKhaledStyles.textStyle(
                                  color: AppColors.primary,
                                  size: 13, weight: FontWeight.w400,

                                ))
                          ],
                        )),
                  ):
                  SizedBox.shrink(),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(end: 10.w),
                    child: ResuableText(
                      text: 'Sources',
                      color: AppColors.c7CBDE0,
                      fontSize: 13,
                        textDecoration: TextDecoration.underline,

                    ),
                  ),
                  SizedBox(height: 10.h,),
                  recievedData.source!.name!=null?
                  Padding(
                    padding:  EdgeInsetsDirectional.only(end: 10.w),
                    child: ResuableText(
                      text: '@ ${recievedData.source!.name}. All rights Reserved',
                      color: AppColors.cCFCFCF,
                      fontSize: 11,
                    ),
                  ):Padding(
                    padding:  EdgeInsetsDirectional.only(end: 10.w),
                    child: ResuableText(
                      text: '@ ${recievedData.source!.id}. All rights Reserved',
                      color: AppColors.cCFCFCF,
                      fontSize: 11,
                    ),
                  )



                ],
              ),
            ),
          )
    ]
    ));
  }
}
