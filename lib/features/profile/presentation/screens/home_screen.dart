




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/shared_button.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../generated/l10n.dart';
import '../components/my_drawer_body.dart';
import '../components/my_drawer_header.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: Drawer(
        child: Column(
          children: [MyDrawerHeader(), MyDrawerBody()],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: Builder(
          builder: (BuildContext context) {
            return AppBar(
              automaticallyImplyLeading: false,
              leading: InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child:
                    Image.asset(AppAssets.homelines, color: AppColors.primary),
              ),
              title: Column(
                children: [
                  Text(
                    S.of(context).hi,
                    style: AppTextStyles.font16
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    S.of(context).khaled + ' !',
                    style: AppTextStyles.font16.copyWith(),
                  ),
                ],
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(AppAssets.profilePic),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /*  Icon(Icons.people_alt_outlined,color: AppColors.white,size: 35,),
              Icon(Icons.medical_services_outlined,color: AppColors.white,size: 35,),
              Icon(Icons.newspaper_sharp,color: AppColors.white,size: 35,),*/
              GestureDetector(
                onTap: ()
                {
                  Navigator.pushNamed(context, Routes.communityhomescreen);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage(AppAssets.community),
                      fit: BoxFit.fill,
                      color: AppColors.black,
                      width: 25,

                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      S.of(context).community,
                      style: AppTextStyles.font16.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage(AppAssets.diagnosis),
                    color: AppColors.black,
                    fit: BoxFit.fill,
                    width: 25,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    S.of(context).diagnosis,
                    style: AppTextStyles.font16.copyWith(color: AppColors.white),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage(AppAssets.news),
                    color: AppColors.black,
                    fit: BoxFit.fill,
                    width: 25,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    S.of(context).news,
                    style: AppTextStyles.font16.copyWith(color: AppColors.white),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage(AppAssets.doctors),
                    color: AppColors.black,
                    fit: BoxFit.fill,
                    width: 25,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    S.of(context).doctors,
                    style: AppTextStyles.font16.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    color:  AppColors.str.withOpacity(.2),                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color:  AppColors.black
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.asset(AppAssets.takepic,width: 59,height: 63,),
                              Text(S.of(context).take),
                              Text(S.of(context).picture),
                            ],
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.navigate_next_sharp),
                          SizedBox(width: 15,),
                          Column(
                            children: [
                              Image.asset(AppAssets.report,width: 59,height: 63,),
                              Text(S.of(context).see),
                              Text(S.of(context).hdiagnosis),
                            ],
                          ),
                          SizedBox(width: 15,),
                          Icon(Icons.navigate_next_sharp),
                          SizedBox(width: 5,),
                          Column(
                            children: [
                              Image.asset(AppAssets.medicine,width: 59,height: 63,),
                              Text(S.of(context).get),
                              Text(S.of(context).medicine),
                            ],
                          ),


                        ],
                      ),
                      SizedBox(height: 30,),
                      SharedButton(
                          width: 260,
                          height: 42,
                          hasBorderRadius: true,
                          borderRadiusValue: 16,
                          text: S.of(context).takeapic,
                          textStyle: AppTextStyles.font16.copyWith(color: AppColors.white),
                          buttonColor: AppColors.primary)

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
/*


         SizedBox(height: 20,),
              Text('All Features',style:AppTextStyles.font14.copyWith(color: AppColors.black),),
              SizedBox(height: 15,),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: AppColors.black
                    )
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(AppAssets.takepic,width: 59,height: 63,),
                              Text(S.of(context).oral,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                              Text(S.of(context).photoSharing,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                            ],
                          ),
                          SizedBox(width: 22,),
                          Column(
                            children: [
                              Image.asset(AppAssets.report,width: 59,height: 63,),
                              Text(S.of(context).educational,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                              Text(S.of(context).contentaccess,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                            ],
                          ),
                          SizedBox(width: 25,),
                          Column(
                            children: [
                              Image.asset(AppAssets.comm,width: 59,height: 63,),
                              Text(S.of(context).communityh,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                              Text(S.of(context).connectionplatform,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(AppAssets.report,width: 59,height: 63,),
                              Text(S.of(context).detection,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                              Text(S.of(context).resultretrival,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),

                            ],
                          ),
                          SizedBox(width: 60,),
                          Column(
                            children: [
                              Icon(Icons.rule_sharp,size: 50,),
                              Text(S.of(context).medical,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                              Text(S.of(context).attentionguid,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                            ],
                          ),
                          SizedBox(width: 50,),
                          Column(
                            children: [
                              Icon(Icons.local_hospital_outlined,size: 50),
                              Text(S.of(context).nearest,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),
                              Text(S.of(context).hospitallocation,style: AppTextStyles.font14.copyWith(color: AppColors.black,fontWeight: FontWeight.normal),),

                            ],
                          ),

                        ],
                      ),
                    ),


                  ],
                ),
              ),




 */