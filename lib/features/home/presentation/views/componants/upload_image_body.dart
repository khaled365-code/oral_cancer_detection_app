import 'package:flutter/material.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height:8,),
          const CustomContainer(conHeight:150,conWidth:250,conImage:AppAssets.uploadBackground),
          const SizedBox(height:20,),
          const Text('Upload the image of the impaired tissue in your mouth',
            textAlign: TextAlign.center,),
          const SizedBox(height:16,),
          const CustomContainer(conHeight:190,conWidth:260,conImage:AppAssets.empty),
          const SizedBox(height:30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButton(textState:'UPLOAD',
                  bIcon:const Icon(Icons.upload ,color: Colors.white,),
                  onPressed:(){}),
              //const SizedBox(width:16,),
              CustomTextButton(textState:'NEXT',
                bIcon:const Icon(Icons.arrow_forward_rounded ,color: Colors.white,) ,
                onPressed:(){
                navigate(context: context, route: Routes.radioQueastion);

                },),
            ],
          ),
        ],
      ),
    );

  }
}
