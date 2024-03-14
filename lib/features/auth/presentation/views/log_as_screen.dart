import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_text_button.dart';

class LogAs extends StatelessWidget{

  const LogAs({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding:const EdgeInsets.only(right: 10,left:6),
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              const CustomContainer(conHeight:220,conWidth:230,conImage:AppAssets.logAs),
              const SizedBox(height:10,),
              const Text('Please Tell Us Are You ' ,
                style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextButton(textState:'patient',onPressed: (){
                    navigate(context: context, route: Routes.loginScreen);
                  },),
                  const SizedBox(width:14,),
                  CustomTextButton(textState:'Doctor',onPressed: (){
                    navigate(context: context, route: Routes.loginScreen);
                  }),
                ],
              ),

            ],

          ),
        ),
      ),


    );

  }

}