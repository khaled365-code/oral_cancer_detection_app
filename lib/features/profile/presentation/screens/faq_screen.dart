


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../components/privacy_item.dart';

class FaqScreen extends StatefulWidget {

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {

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
          title: 'faq'.tr(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsetsDirectional.only(top: 30.h,start:8.w,end:5.w,bottom: 15.h),
          child: Column(
            children: [
              PrivacyContainerItem(
                text: 'faq1'.tr(context),
                onTap: () {
                  setState(() {
                    pressed1 = !pressed1;
                  });
                },
                isPressed: pressed1,
                answerText: 'faqans1'.tr(context),
              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'faq2'.tr(context),
                onTap: () {
                  setState(
                        () {
                      pressed2 = !pressed2;
                    },
                  );
                },
                isPressed: pressed2,
                answerText: 'faqans2'.tr(context),
              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'faq3'.tr(context),
                onTap: () {
                  setState(
                        () {
                      pressed3 = !pressed3;
                    },
                  );
                },
                isPressed: pressed3,
                answerText: 'faqans3'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'faq4'.tr(context),
                onTap: () {
                  setState(
                        () {
                      pressed4 = !pressed4;
                    },
                  );
                },
                isPressed: pressed4,
                answerText: 'faqans4'.tr(context)

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'faq5'.tr(context),
                onTap: () {
                  setState(
                        () {
                      pressed5 = !pressed5;
                    },
                  );
                },
                isPressed: pressed5,
                answerText: 'faqans5'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'faq6'.tr(context),
                onTap: () {
                  setState(
                        () {
                      pressed6 = !pressed6;
                    },
                  );
                },
                isPressed: pressed6,
                answerText: 'faqans6'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'faq7'.tr(context),
                onTap: () {
                  setState(
                        () {
                      pressed7 = !pressed7;
                    },
                  );
                },
                isPressed: pressed7,
                answerText: 'faqans7'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'faq8'.tr(context),
                onTap: () {
                  setState(
                        () {
                      pressed8 = !pressed8;
                    },
                  );
                },
                isPressed: pressed8,
                answerText: 'faqans8'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'faq9'.tr(context),
                onTap: () {
                  setState(
                        () {
                      pressed9 = !pressed9;
                    },
                  );
                },
                isPressed: pressed9,
                answerText: 'faqans9'.tr(context),

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'faq10'.tr(context),
                onTap: () {
                  setState(
                        () {
                      pressed10 = !pressed10;
                    },
                  );
                },
                isPressed: pressed10,
                answerText: 'faqans10'.tr(context),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
