import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/news_model.dart';

class News_tile extends StatelessWidget{

  late final ArticleModel articleModel;
  News_tile({required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
        child: Container(
          color: Colors.white,

          child:
          GestureDetector(onTap: _launchUrl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                ClipRRect(

                  borderRadius: BorderRadius.circular(8),
                  child:CachedNetworkImage(
                    errorWidget: (context,url,error)=>const Icon(Icons.error_outline_outlined),
                    placeholder: (context,url)=>const Center(child: CircularProgressIndicator()),
                    height:200 ,width: double.infinity,
                    fit: BoxFit.cover, imageUrl: articleModel.image??"",),
                ),


                 SizedBox(height: 15.h,),
                Text(newsTitlesHandler(),
                  style:  AppTextStyles.font24.copyWith(color: AppColors.primary),
                  maxLines: 2,overflow: TextOverflow.ellipsis,),

                 SizedBox(height: 8.h,),
                Text( newsDescHandler(),style:AppTextStyles.font18.copyWith(color: AppColors.grey,fontWeight: FontWeight.w400),
                  maxLines: 1,overflow: TextOverflow.ellipsis,)
                , SizedBox(height: 10.h,)
                , const Divider(indent: 80,endIndent: 80,color: AppColors.primary,thickness: 2,)

              ],
            ),
          ),

        ),
      );


  }
  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(articleModel.url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  String newsTitlesHandler(){
    if(articleModel.title==null || articleModel.title=="[Removed]"){
      return "Breakthrough Study Reveals Promising Treatment for Alzheimer's Disease";
    }
    else{
      return articleModel.title;
    }
  }
  String newsDescHandler(){
    if(articleModel.subTitle==null || articleModel.subTitle=="[Removed]"){
      return "A recent groundbreaking medical study has uncovered a potential breakthrough in the treatment of Alzheimer's disease, a debilitating neurodegenerative disorder that affects millions worldwide";
    }
    else{
      return articleModel.title;
    }
  }
}