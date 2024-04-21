

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/community/presentation/widgets/comment_container.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/utilis/image_constants.dart';
import '../widgets/post_container.dart';
import '../widgets/post_details_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsetsDirectional.only(start: 18.5.w),
          child: IconButton(
             onPressed: (){
               Navigator.pop(context);
             },
            icon: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.c4C9EEB,size: 15.sp,),),
        ),
        title: Text('Post',
          style: AppKhaledStyles.textStyle(
            color: AppColors.black,
            size: 18 ,
            weight: FontWeight.bold
          ),),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              PostDetailsWidget(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsetsDirectional.only(start: 20.w,bottom: 10.h),
                  itemBuilder: (context, index) => CommentContainer(),
                  itemCount: 10,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color:AppColors.cEFF0F3,
                      width: 2.w
                    )
                  )
                ),
                child: Padding(
                  padding:  EdgeInsets.only(bottom: 8.h,top: 9.h),
                  child: Row(
                    children: [
                      SizedBox(width: 20.w,),
                      Image.asset(ImageConstants.roundPostTwitter),
                      SizedBox(width: 8.w,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.cE7ECF0,
                            borderRadius: BorderRadius.circular(25.r)
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.only(start: 12.w,bottom: 8.h),
                              hintText: 'Tweet your reply',
                              hintStyle: AppKhaledStyles.textStyle(
                                color: AppColors.cAFB8C1,
                                size: 12,
                              )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
