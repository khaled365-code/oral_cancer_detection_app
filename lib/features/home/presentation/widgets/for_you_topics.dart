


import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/home/data/models/for_your_knowledge_model/for_your_knowledge_model.dart';

class ForYouTopics extends StatelessWidget {
  const ForYouTopics({super.key, required this.forYourKnowledgeModel, required this.currentIndex});

 final ForYourKnowledgeModel forYourKnowledgeModel;
 final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        switch(currentIndex)
        {
          case 0:
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;
          default:

        }
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
          padding:  EdgeInsetsDirectional.only(start: 10.w,top: 10.w,end: 10.w),
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
             ResuableText(
               text: forYourKnowledgeModel.description,
               fontSize: 13,
               fontWeight: FontWeight.w500,
               color: AppColors.black,
               maxLines: 3,

             ),

            ]

              ),
        )),
    );
  }
}
