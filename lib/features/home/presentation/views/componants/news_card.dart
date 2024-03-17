import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/news_model.dart';

class News_tile extends StatelessWidget{

  late final ArticleModel articleModel;
  News_tile({required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
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


                const SizedBox(height: 15,),
                Text(articleModel.title??"",
                  style: const TextStyle(fontFamily:"Monday Rain",fontSize: 24,fontWeight: FontWeight.bold,color:Colors.purple),
                  maxLines: 2,overflow: TextOverflow.ellipsis,),

                const SizedBox(height: 8,),
                Text(articleModel.subTitle??" ",style: const TextStyle(fontSize: 18,color: Colors.blueGrey),
                  maxLines: 1,overflow: TextOverflow.ellipsis,)
                ,const SizedBox(height: 10,)
                , const Divider(indent: 80,endIndent: 80,color: Colors.purple,thickness: 2,)

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
}