import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';
import 'package:graduation_project/features/profile/data/models/privacy_screen_model.dart';
import 'package:graduation_project/features/profile/presentation/manager/privacy_screen_cubit/privacy_screen_cubit.dart';

import '../../../../core/utilis/colors.dart';

class PrivacyItemWidget extends StatelessWidget {
  const PrivacyItemWidget({super.key, required this.privacyModel,});

  final PrivacyScreenModel privacyModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrivacyScreenCubit(),
      child: BlocBuilder<PrivacyScreenCubit, PrivacyScreenState>(
        builder: (context, state) {
          final privacyCubit=BlocProvider.of<PrivacyScreenCubit>(context);
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  privacyCubit.changeContainerShape();
                },
                child: Container(
                  height: privacyCubit.containerISOpen ? 180.h : 40.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                          color: AppColors.cEFF0F3,
                        width: 2.w
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 2.h,),
                      Row(
                        children: [
                          SizedBox(width: 8.w,),
                          ResuableText(text: privacyModel.questionText.tr(context),
                            fontSize: 12,
                          ),
                          Spacer(),
                          privacyCubit.containerISOpen == false ?
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.primary,)
                              :
                          Icon(Icons.keyboard_arrow_up,
                            color: AppColors.primary,),
                          SizedBox(width: 8.w,),

                        ],
                      ),
                      if(privacyCubit.containerISOpen == true)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(top: 5.h,
                                    start: 8.w,
                                    end: 23.w),
                                child: LineWidget(),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: 5.h, start: 10.w,),
                                  child: Text('${privacyModel.answerText.tr(context)}',
                                      style: AppKhaledStyles.textStyle(
                                          size: 14,
                                          weight: FontWeight.normal
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}
