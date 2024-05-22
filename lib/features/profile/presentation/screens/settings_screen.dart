import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/features/profile/data/models/settings_data_model.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../components/settings_item_widget.dart';

class SettingsScreen extends StatefulWidget {

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}
   final List<SettingsDataModel> settingsDataList=[
     SettingsDataModel(settingName: 'Password Manager', iconForm: Icons.lock_outlined),
     SettingsDataModel(settingName: 'Delete Account', iconForm: Icons.cancel_outlined),
     SettingsDataModel(settingName: 'Dark Mode', iconForm:FontAwesomeIcons.moon)


   ];
class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        children:
        [
          Padding(
            padding:  EdgeInsetsDirectional.only(top: 40.h,start: 15.w,end: 25.w),
            child: BodyAppBar(
              hasLeading: true,
              hasTitle: true,
              leading: GestureDetector(
                onTap: ()
                {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.cEFF0F3,
                          width: 2.w
                      )
                  ),
                  child: Icon(Icons.arrow_back_outlined,size: 20.sp,),
                ),
              ) ,
              title: Text('Settings',style: AppKhaledStyles.textStyle(color: AppColors.black,weight: FontWeight.bold,size: 16),),
            ),
          ),
          Expanded(
            child: ListView.separated(
                padding:  EdgeInsetsDirectional.only(start: 20.w,end: 20.w,top: 30.h),
                itemBuilder: (context, index) => SettingsItemWidget(
                  currentIndex: index,
                 settingsDataModel: settingsDataList[index],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                itemCount: settingsDataList.length),
          )
         

        ],
      ),
    );
  }

}






