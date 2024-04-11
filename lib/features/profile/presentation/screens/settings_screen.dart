
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../components/notification_container.dart';

class SettingsScreen extends StatefulWidget {

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {

    bool darkModeSwitch=false;
    bool noteSwitch=true;
    bool updateSwitch=true;

    String country='EGY';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: CustomAppBar(
          title: S.of(context).settings,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24,top: 33,right: 28),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('settings',style:AppTextStyles.font20.copyWith(color: AppColors.primary),),
              SizedBox(height: 25,),
              Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.account,
                        color: AppColors.primary,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'data',
                        style:AppTextStyles.font16.copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(S.of(context).editprofile,
                      style: AppTextStyles.font16
                          .copyWith(color: AppColors.black)),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Change Password',
                    style:
                        AppTextStyles.font16.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
              SizedBox(height: 35,),
              Row(
                children: [
                  Image.asset(
                    AppAssets.notification,
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Notifications',
                    style: AppTextStyles.font16.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Row(children:
              [
              Text('Notification',style:AppTextStyles.font16.copyWith(color: AppColors.black),),
              Spacer(),
              Switch(
                activeColor: AppColors.primary,
                value: noteSwitch, onChanged: (value)
              {
                setState(() {
                  noteSwitch=value;
                });
              },),
              ]),
              SizedBox(height: 19,),
              Row(children:
              [
                Text('Updates',style:AppTextStyles.font16.copyWith(color: AppColors.black),),
                Spacer(),
                Switch(
                  activeColor: AppColors.primary,
                  value: updateSwitch, onChanged: (value)
                {
                  setState(() {
                    updateSwitch=value;
                  });
                },),
              ]),
              SizedBox(height: 50,),
              Row(
                children: [
                  Image.asset(
                    AppAssets.settings,
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Other',
                    style: AppTextStyles.font16.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Row(children:
              [
                Text('Dark Mode',style:AppTextStyles.font16.copyWith(color: AppColors.black),),
                Spacer(),
                Switch(
                  activeColor: AppColors.primary,
                  value: darkModeSwitch, onChanged: (value)
                {
                  setState(() {
                    darkModeSwitch=value;
                  });
                },),
              ]),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text('Region',style:AppTextStyles.font16.copyWith(color: AppColors.black),),
                  Spacer(),
                  Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.settings,
                      border: Border.all(
                        color: AppColors.grgr,
                      ),
                    ),
                    child: DropdownButton(
                      items: ['EGY', 'SAU', 'KWT', 'USA', 'AUS', 'QAT'].
                      map((e) =>
                          DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text('$e'),
                            ),
                            value: e,
                          )).toList(),
                      onChanged: (value) {
                        setState(() {
                          country = value!;
                        });
                      },
                      value: country,
                    ),
                  ),
                ],
              ),
            ],
                ),
              ),
                ),
        );
  }
}






