



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../components/post_container.dart';

class CommunityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: Builder(
          builder: (BuildContext context) {
            return AppBar(
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child:CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(AppAssets.profilePic),
                  ),
                ),
              ),
              title: Text('Welcome!',style: AppTextStyles.font16.copyWith()),
              centerTitle: true,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children:
                [
                  Padding(
              padding: const EdgeInsets.only(left: 10,right: 20,top: 10),
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  TextButton(onPressed: () {}, child: Text('For You',style:AppTextStyles.font16.copyWith())),
                  SizedBox(
                    width: 70,
                  ),
                  TextButton(onPressed: () {}, child: Text('Lastest',style:AppTextStyles.font16.copyWith())),
                  SizedBox(
                    width: 70,
                  ),
                  TextButton(onPressed: () {}, child: Text('New!',style:AppTextStyles.font16.copyWith())),
                ]),
              ),
            ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: PostContainer(
                      postHours: '3h',
                      postOwner: 'Michael Daly',
                      postOwnerPhoto: AppAssets.profilePic,
                      postText: 'Oral cancer symptoms can include persistent mouth sores, unusual lumps, or patches in the mouth or throat. Don\'t ignore any changes in your oral health—early detection is key! Regular dental check-ups and self-examinations are essential for spotting potential warning signs. #OralHealth #CancerAwareness',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: PostContainer(
                      postHours: '3h',
                      postOwner: 'Michael Daly',
                      postOwnerPhoto: AppAssets.profilePic,
                      postText: 'Oral cancer symptoms can include persistent mouth sores, unusual lumps, or patches in the mouth or throat. Don\'t ignore any changes in your oral health—early detection is key! Regular dental check-ups and self-examinations are essential for spotting potential warning signs. #OralHealth #CancerAwareness',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),Divider(
                  thickness: 1,
                  color: AppColors.grgr,
                ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: PostContainer(
                      postHours: '3h',
                      postOwner: 'Michael Daly',
                      postOwnerPhoto: AppAssets.profilePic,
                      postText: 'Oral cancer symptoms can include persistent mouth sores, unusual lumps, or patches in the mouth or throat. Don\'t ignore any changes in your oral health—early detection is key! Regular dental check-ups and self-examinations are essential for spotting potential warning signs. #OralHealth #CancerAwareness',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),


                ]

              ),
        ),
      ),



    );
  }
}


