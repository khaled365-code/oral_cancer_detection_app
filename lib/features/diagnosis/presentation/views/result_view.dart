import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/utilis/commons.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';

import '../../../../core/utilis/app_colors.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions:  [IconButton(onPressed: () {
        navigate(context: context, route: Routes.home);
        }, icon: const Icon(Icons.home),)
      ],
      ),
      backgroundColor: AppColors.background,
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Please note that this result is not definitive and it is important to consult a doctor for further testing and evaluation , we can suggest a professional doctors for you...",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.primary),),
            TextButton(onPressed: (){}, child: const Text("Click here to show them",style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),)),
            const SizedBox(height: 60,),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.background,AppColors.primary],begin: Alignment.topLeft,end: Alignment.bottomRight),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16),bottomLeft: Radius.circular(16)),


              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("Test Result",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                    ),
                    SizedBox(height: 40,),
                    Text("Disease Name:  oscc(oral squamous cancer cell)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    SizedBox(height: 20,),
                    Text("Classification:  cancer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)

                  ],
                ),
              ),
            ),
            const SizedBox(height: 50,),
            CustomElevatedButton(onpress: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.primary)), child: const Text("Finish"),)


          ],),
      ),
    );
  }
}