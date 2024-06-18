import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/presentation/widgets/news_card.dart';
import 'package:shimmer/shimmer.dart';


class NewsShimmer extends  StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount:15,
        itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              color: Colors.white,
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 32.0,
              color: Colors.white,
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 15.0,
              color: Colors.white,
            ),
            SizedBox(height: 16.0),
          ],
        ),
      );
    }
    )
    );
  }
}