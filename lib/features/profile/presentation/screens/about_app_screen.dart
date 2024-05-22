
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../../../../core/widgets/resuable_text.dart';
import '../components/about_app_container.dart';

class AboutAppScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 40.h, start: 15.w, end: 25.w),
            child: BodyAppBar(
              hasLeading: true,
              hasTitle: true,
              leading: GestureDetector(
                onTap: () {
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
                  child: Icon(Icons.arrow_back_outlined, size: 20.sp,),
                ),
              ),
              title: Text('About App', style: AppKhaledStyles.textStyle(
                  color: AppColors.black,
                  weight: FontWeight.bold,
                  size: 16),),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top:20.h,start: 20.w,end:20.w),
            child: Column(
              children: [
                AboutAppContainerItem(
                  text: 'faq'.tr(context),
                  onTap: ()
                  {
                   Navigator.pushNamed(context, Routes.faqscreen);
                  },
                ),
                LineWidget(
                  color: AppColors.grgr,
                ),
                AboutAppContainerItem(
                  text: 'feedback'.tr(context),
                  onTap: ()
                  {
                    Navigator.pushNamed(context, Routes.feedbackscreen);

                  },
                ),
                LineWidget(
                  color: AppColors.grgr,
                ),
                AboutAppContainerItem(
                  text: 'policy'.tr(context),
                  onTap: ()
                  {
                    Navigator.pushNamed(context, Routes.privacypolicyscreen);
                  },
                ),
                LineWidget(
                  color: AppColors.grgr,
                ),

              ],
            ),
          ),
          Spacer(),
          Center(child: ResuableText(text: 'version'.tr(context),fontSize: 16,fontWeight: FontWeight.normal,)),
          SizedBox(height: 20.h,),
        ],
      ),

    );

  }
}


