
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_app_bar.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../generated/l10n.dart';
import '../components/about_app_container.dart';

class AboutAppScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          title: S.of(context).about,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top:20.h,start: 20.w,end:20.w),
              child: Column(
                children: [
                  AboutAppContainerItem(
                    text: S.of(context).faq,
                    onTap: ()
                    {
                     Navigator.pushNamed(context, Routes.faqscreen);
                    },
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),
                  AboutAppContainerItem(
                    text: S.of(context).feedback,
                    onTap: ()
                    {
                      Navigator.pushNamed(context, Routes.feedbackscreen);

                    },
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.grgr,
                  ),
                  AboutAppContainerItem(
                    text: S.of(context).policy,
                    onTap: ()
                    {
                      Navigator.pushNamed(context, Routes.privacypolicyscreen);
                    },
                  ),

                ],
              ),
            ),
            Padding(
              padding:EdgeInsetsDirectional.only(start: 10.w),
              child: Divider(
                thickness: 1,
                color: AppColors.grgr,
                indent: 3,
              ),
            ),
            SizedBox(
              height:375.h,
            ),
            Text(
              S.of(context).version,
              style: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),

    );

  }
}


