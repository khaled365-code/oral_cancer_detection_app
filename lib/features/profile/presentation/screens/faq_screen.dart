import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/features/profile/presentation/manager/faq_screen_cubit/faq_screen_cubit.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../components/faq_item_widget.dart';
import '../components/privacy_item.dart';

class FaqScreen extends StatefulWidget {

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqScreenCubit, FaqScreenState>(
      builder: (context, state) {
        final faqCubit=BlocProvider.of<FaqScreenCubit>(context);
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
                  title: Text('FAQ', style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight: FontWeight.bold,
                      size: 16),),
                ),
              ),
              Expanded(

                child: ListView.separated(
                    padding: EdgeInsetsDirectional.only(
                    start: 20.w, end: 15.w, top: 20.h,bottom:30.h),
                    itemBuilder: (context, index) =>
                        FaqItemWidget(
                          faqModel: faqCubit.faqDataList[index],
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 15.h,),
                    itemCount: faqCubit.faqDataList.length),
              ),

              // PrivacyContainerItem(
              //   text: 'faq1'.tr(context),
              //   onTap: () {
              //     setState(() {
              //       pressed1 = !pressed1;
              //     });
              //   },
              //   isPressed: pressed1,
              //   answerText: 'faqans1'.tr(context),
              // ),
              // PrivacyContainerItem(
              //   text: 'faq1'.tr(context),
              //   onTap: () {
              //     setState(() {
              //       pressed1 = !pressed1;
              //     });
              //   },
              //   isPressed: pressed1,
              //   answerText: 'faqans1'.tr(context),
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // PrivacyContainerItem(
              //   text: 'faq2'.tr(context),
              //   onTap: () {
              //     setState(
              //           () {
              //         pressed2 = !pressed2;
              //       },
              //     );
              //   },
              //   isPressed: pressed2,
              //   answerText: 'faqans2'.tr(context),
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // PrivacyContainerItem(
              //   text: 'faq3'.tr(context),
              //   onTap: () {
              //     setState(
              //           () {
              //         pressed3 = !pressed3;
              //       },
              //     );
              //   },
              //   isPressed: pressed3,
              //   answerText: 'faqans3'.tr(context),
              //
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // PrivacyContainerItem(
              //   text: 'faq4'.tr(context),
              //   onTap: () {
              //     setState(
              //           () {
              //         pressed4 = !pressed4;
              //       },
              //     );
              //   },
              //   isPressed: pressed4,
              //   answerText: 'faqans4'.tr(context)
              //
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // PrivacyContainerItem(
              //   text: 'faq5'.tr(context),
              //   onTap: () {
              //     setState(
              //           () {
              //         pressed5 = !pressed5;
              //       },
              //     );
              //   },
              //   isPressed: pressed5,
              //   answerText: 'faqans5'.tr(context),
              //
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // PrivacyContainerItem(
              //   text: 'faq6'.tr(context),
              //   onTap: () {
              //     setState(
              //           () {
              //         pressed6 = !pressed6;
              //       },
              //     );
              //   },
              //   isPressed: pressed6,
              //   answerText: 'faqans6'.tr(context),
              //
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // PrivacyContainerItem(
              //   text: 'faq7'.tr(context),
              //   onTap: () {
              //     setState(
              //           () {
              //         pressed7 = !pressed7;
              //       },
              //     );
              //   },
              //   isPressed: pressed7,
              //   answerText: 'faqans7'.tr(context),
              //
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // PrivacyContainerItem(
              //   text: 'faq8'.tr(context),
              //   onTap: () {
              //     setState(
              //           () {
              //         pressed8 = !pressed8;
              //       },
              //     );
              //   },
              //   isPressed: pressed8,
              //   answerText: 'faqans8'.tr(context),
              //
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // PrivacyContainerItem(
              //   text: 'faq9'.tr(context),
              //   onTap: () {
              //     setState(
              //           () {
              //         pressed9 = !pressed9;
              //       },
              //     );
              //   },
              //   isPressed: pressed9,
              //   answerText: 'faqans9'.tr(context),
              //
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // PrivacyContainerItem(
              //   text: 'faq10'.tr(context),
              //   onTap: () {
              //     setState(
              //           () {
              //         pressed10 = !pressed10;
              //       },
              //     );
              //   },
              //   isPressed: pressed10,
              //   answerText: 'faqans10'.tr(context),
              //
              // ),
            ],
          ),
        );
      },
    );
  }
}
