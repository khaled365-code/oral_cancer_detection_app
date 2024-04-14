import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_text_button.dart';

class UploadImageBody extends StatelessWidget {
  const UploadImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12,vertical: 8),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height:8.h,),
          CustomContainer(conHeight:150.h,conWidth:250.w,conImage:AppAssets.uploadBackground),
          SizedBox(height:20.h,),
          const Text('Upload the image of the impaired tissue in your mouth',
            textAlign: TextAlign.center,),
          SizedBox(height:16.h,),
          CustomContainer(conHeight:190.h,conWidth:260.w,conImage:AppAssets.empty),
          SizedBox(height:30.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButton(
                  textState:'UPLOAD',
                  bIcon:const Icon(Icons.upload ,color: Colors.white,),
                  onPressed:(){}),
              //const SizedBox(width:16,),
              CustomTextButton(
                textState:'NEXT',
                bIcon:const Icon(Icons.arrow_forward_rounded ,color: Colors.white,) ,
                onPressed:(){
                navigate(context: context, route: Routes.questionsView);

                },),
            ],
          ),
        ],
      ),
    );

  }
}
