




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../generated/l10n.dart';
import 'drawer_body_item.dart';

class MyDrawerBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.only(left: 10,top: 10),
     child: Column(
       children: [
         DrawerItem(
           text: S.of(context).editprofile,
           image: AppAssets.editprofile,
           onPressed: ()
           {
             Navigator.pushNamed(context, Routes.editProfilescreen);
           },
         ),
         SizedBox(height: 10,),
         DrawerItem(
           text: S.of(context).language,
           image: AppAssets.language,
           onPressed: ()
           {
             showDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                          title: Text(S.of(context).language),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(S.of(context).english,
                                      style: AppTextStyles.font16)),
                              Divider(
                                  thickness: 2,
                                  indent: 1,
                                  endIndent: 1,
                                  color: AppColors.grey),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(S.of(context).arabic,
                                      style: AppTextStyles.font16)),
                            ],
                          ),
                        ));
              },
         ),
         SizedBox(height: 10,),
         DrawerItem(
           text: S.of(context).settings,
           image: AppAssets.settings,
           onPressed: ()
           {
             Navigator.pushNamed(context, Routes.settings);

           },
         ),
         SizedBox(height: 10,),
         DrawerItem(
           text: S.of(context).location,
           image: AppAssets.location,
           onPressed: ()
           {

           },
         ),
         SizedBox(height: 10,),
         DrawerItem(
           text: S.of(context).help,
           image: AppAssets.question,
           onPressed: ()
           {

           },
         ),
         SizedBox(height: 10,),
         DrawerItem(
           text: S.of(context).about,
           image: AppAssets.help,
           onPressed: ()
           {
             Navigator.pushNamed(context, Routes.aboutApp);
           },
         ),
         SizedBox(height: 10,),
         DrawerItem(
           text: S.of(context).logout,
           image: AppAssets.logout,
           onPressed: ()
           {
             showDialog(
                 context: context,
                 builder: (context) => CupertinoAlertDialog(
                   title: Text(S.of(context).logout),
                   content: Column(
                     children: [
                       SizedBox(height: 10,),
                       Text(S.of(context).logoutsure,style:AppTextStyles.font14.copyWith(color: AppColors.black),),
                       SizedBox(height: 5,),
                       Divider(
                           thickness: 2,
                           color: Colors.grey[400]),
                       Row(
                         children: [
                           TextButton(onPressed: (){}, child: Text(S.of(context).cancel,style: AppTextStyles.font16.copyWith(color: AppColors.primary))),
                           Spacer(),
                           TextButton(onPressed: (){}, child: Text(S.of(context).logout,style: AppTextStyles.font16.copyWith(color: AppColors.primary))),


                         ],
                       )

                     ],
                   ),
                 ));
           },
         ),
         SizedBox(height: 10,),


       ],
     )
   );
  }
}




