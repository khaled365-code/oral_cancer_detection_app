


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          title: 'S.of(context).faq',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsetsDirectional.only(top: 30.h,start:8.w,end:5.w,bottom: 15.h),
          child: Column(
            children: [
              PrivacyContainerItem(
                text: 'S.of(context).faq1',
                onTap: () {
                  setState(() {
                    pressed1 = !pressed1;
                  });
                },
                isPressed: pressed1,
                answerText: 'S.of(context).faqans1',
              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'S.of(context).faq2',
                onTap: () {
                  setState(
                        () {
                      pressed2 = !pressed2;
                    },
                  );
                },
                isPressed: pressed2,
                answerText: 'S.of(context).faqans2',
              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'S.of(context).faq3',
                onTap: () {
                  setState(
                        () {
                      pressed3 = !pressed3;
                    },
                  );
                },
                isPressed: pressed3,
                answerText: 'S.of(context).faqans3',

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'S.of(context).faq4',
                onTap: () {
                  setState(
                        () {
                      pressed4 = !pressed4;
                    },
                  );
                },
                isPressed: pressed4,
                answerText: 'S.of(context).faqans4,'

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'S.of(context).faq5',
                onTap: () {
                  setState(
                        () {
                      pressed5 = !pressed5;
                    },
                  );
                },
                isPressed: pressed5,
                answerText: 'S.of(context).faqans5',

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'S.of(context).faq6',
                onTap: () {
                  setState(
                        () {
                      pressed6 = !pressed6;
                    },
                  );
                },
                isPressed: pressed6,
                answerText: 'S.of(context).faqans6',

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'S.of(context).faq7',
                onTap: () {
                  setState(
                        () {
                      pressed7 = !pressed7;
                    },
                  );
                },
                isPressed: pressed7,
                answerText: 'S.of(context).faqans7',

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'S.of(context).faq8',
                onTap: () {
                  setState(
                        () {
                      pressed8 = !pressed8;
                    },
                  );
                },
                isPressed: pressed8,
                answerText: 'S.of(context).faqans8',

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'S.of(context).faq9',
                onTap: () {
                  setState(
                        () {
                      pressed9 = !pressed9;
                    },
                  );
                },
                isPressed: pressed9,
                answerText: 'S.of(context).faqans9',

              ),
              SizedBox(
                height: 15.h,
              ),
              PrivacyContainerItem(
                text: 'S.of(context).faq10',
                onTap: () {
                  setState(
                        () {
                      pressed10 = !pressed10;
                    },
                  );
                },
                isPressed: pressed10,
                answerText: 'S.of(context).faqans10',

              ),
            ],
          ),
        ),
      ),
    );
  }
}
