
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
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
          title: S.of(context).policy,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 30.h,start: 15.w,end: 15.w,bottom: 15.h),
          child: Column(
            children: [
              PrivacyContainerItem(
                text: S.of(context).question1,
                onTap: () {
                  setState(() {
                    pressed1 = !pressed1;
                  });
                },
                isPressed: pressed1,
                answerText: S.of(context).answer1,
              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: S.of(context).question2,
                onTap: () {
                  setState(
                    () {
                      pressed2 = !pressed2;
                    },
                  );
                },
                isPressed: pressed2,
                answerText: S.of(context).answer2,
              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: S.of(context).question3,
                onTap: () {
                  setState(
                    () {
                      pressed3 = !pressed3;
                    },
                  );
                },
                isPressed: pressed3,
                answerText: S.of(context).answer3,

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: S.of(context).question4,
                onTap: () {
                  setState(
                    () {
                      pressed4 = !pressed4;
                    },
                  );
                },
                isPressed: pressed4,
                answerText: S.of(context).answer4,

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: S.of(context).question5,
                onTap: () {
                  setState(
                    () {
                      pressed5 = !pressed5;
                    },
                  );
                },
                isPressed: pressed5,
                answerText: S.of(context).answer5,

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: S.of(context).question6,
                onTap: () {
                  setState(
                    () {
                      pressed6 = !pressed6;
                    },
                  );
                },
                isPressed: pressed6,
                answerText: S.of(context).answer6,

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: S.of(context).question7,
                onTap: () {
                  setState(
                    () {
                      pressed7 = !pressed7;
                    },
                  );
                },
                isPressed: pressed7,
                answerText: S.of(context).answer7,

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: S.of(context).question8,
                onTap: () {
                  setState(
                    () {
                      pressed8 = !pressed8;
                    },
                  );
                },
                isPressed: pressed8,
                answerText: S.of(context).answer8,

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: S.of(context).question9,
                onTap: () {
                  setState(
                    () {
                      pressed9 = !pressed9;
                    },
                  );
                },
                isPressed: pressed9,
                answerText: S.of(context).answer9,

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: S.of(context).question10,
                onTap: () {
                  setState(
                    () {
                      pressed10 = !pressed10;
                    },
                  );
                },
                isPressed: pressed10,
                answerText: S.of(context).answer10,

              ),
            ],
          ),
        ),
      ),
    );
  }
}


