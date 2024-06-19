

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/home/data/models/for_you_article_data_model/for_you_article_data.dart';

class ForYouArticle extends StatelessWidget {
  const ForYouArticle({super.key});




  @override
  Widget build(BuildContext context) {
    final recievedModel=ModalRoute.of(context)!.settings.arguments as ForYouArticleDataModel;
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
            text: recievedModel.title,
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
                      imageUrl: recievedModel.image,fit: BoxFit.fill,)),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsetsDirectional.only(start: 10.w,top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [

                      ResuableText(text: recievedModel.title,
                          color: AppColors.c232323,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          maxLines: 5),
                      SizedBox(height: 10.h,),
                      ResuableText(
                        text: 'By ${recievedModel.author}',
                        color: AppColors.cCFCFCF,
                        fontSize: 12,
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 10.w),
                        child: ResuableText(
                          text: recievedModel.content,
                          color: AppColors.c4B4B4B,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                      Padding(
                        padding:  EdgeInsetsDirectional.only(end: 10.w),
                        child: ResuableText(
                          text: '@ ${recievedModel.sources}. All rights Reserved',
                          color: AppColors.cCFCFCF,
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(height: 20.h,)

                    ],
                  ),
                ),
              )
            ]
        ));
  }
}
