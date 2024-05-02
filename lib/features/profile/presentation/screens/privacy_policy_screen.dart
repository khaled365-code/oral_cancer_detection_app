
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../components/privacy_item.dart';

class PrivacyPolicyScreen extends StatefulWidget {

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
   bool pressed1=false;
   bool pressed2=false;
   bool pressed3=false;
   bool pressed4=false;
   bool pressed5=false;
   bool pressed6=false;
   bool pressed7=false;
   bool pressed8=false;
   bool pressed9=false;
   bool pressed10=false;


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          title: 'policy'.tr(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 30.h,start: 15.w,end: 15.w,bottom: 15.h),
          child: Column(
            children: [
              PrivacyContainerItem(
                text: 'question1'.tr(context),
                onTap: () {
                  setState(() {
                    pressed1 = !pressed1;
                  });
                },
                isPressed: pressed1,
                answerText: 'answer1'.tr(context),
              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'question2'.tr(context),
                onTap: () {
                  setState(
                    () {
                      pressed2 = !pressed2;
                    },
                  );
                },
                isPressed: pressed2,
                answerText: 'answer2'.tr(context),
              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'question3'.tr(context),
                onTap: () {
                  setState(
                    () {
                      pressed3 = !pressed3;
                    },
                  );
                },
                isPressed: pressed3,
                answerText: 'answer3'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'question4'.tr(context),
                onTap: () {
                  setState(
                    () {
                      pressed4 = !pressed4;
                    },
                  );
                },
                isPressed: pressed4,
                answerText: 'answer4'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'question5'.tr(context),
                onTap: () {
                  setState(
                    () {
                      pressed5 = !pressed5;
                    },
                  );
                },
                isPressed: pressed5,
                answerText: 'answer5'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'question6'.tr(context),
                onTap: () {
                  setState(
                    () {
                      pressed6 = !pressed6;
                    },
                  );
                },
                isPressed: pressed6,
                answerText: 'answer6'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'question7'.tr(context),
                onTap: () {
                  setState(
                    () {
                      pressed7 = !pressed7;
                    },
                  );
                },
                isPressed: pressed7,
                answerText: 'answer7'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'question8'.tr(context),
                onTap: () {
                  setState(
                    () {
                      pressed8 = !pressed8;
                    },
                  );
                },
                isPressed: pressed8,
                answerText: 'answer8'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'question9'.tr(context),
                onTap: () {
                  setState(
                    () {
                      pressed9 = !pressed9;
                    },
                  );
                },
                isPressed: pressed9,
                answerText: 'answer9'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'question10'.tr(context),
                onTap: () {
                  setState(
                    () {
                      pressed10 = !pressed10;
                    },
                  );
                },
                isPressed: pressed10,
                answerText: 'answer10'.tr(context),

              ),
            ],
          ),
        ),
      ),
    );
  }
}


