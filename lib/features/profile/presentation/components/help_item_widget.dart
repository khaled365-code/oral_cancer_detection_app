import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';
import 'package:graduation_project/features/profile/presentation/manager/help_screen_cubit/help_screen_cubit.dart';

import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../data/profile_models/help_model.dart';

class HelpItemWidget extends StatelessWidget {
  const HelpItemWidget({super.key, required this.helpModel,});

  final HelpModel helpModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpScreenCubit(),
      child: BlocBuilder<HelpScreenCubit, HelpScreenState>(
        builder: (context, state) {
          final helpScreenCubit=BlocProvider.of<HelpScreenCubit>(context);
          return Column(
            children: [
              GestureDetector(
                onTap: ()
                {
                  helpScreenCubit.changeContainerShape();
                },
                child: Container(
                  height: helpScreenCubit.containerISOpen? 145.h : 40.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                          color: AppColors.cEFF0F3
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 2.h,),
                      Row(
                        children: [
                          SizedBox(width: 8.w,),
                          ResuableText(text: helpModel.questionText,
                            fontSize: 12,
                          ),
                          Spacer(),
                          helpScreenCubit.containerISOpen == false ?
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.primary,)
                              :
                          Icon(Icons.keyboard_arrow_up, color: AppColors.primary,),
                          SizedBox(width: 8.w,),

                        ],
                      ),
                      if(helpScreenCubit.containerISOpen==true)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:EdgeInsetsDirectional.only(top: 5.h,start: 8.w,end: 23.w),
                                child: LineWidget(),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:EdgeInsetsDirectional.only(top: 5.h,start: 10.w,),
                                  child: Text('${helpModel.answerText}',style: AppKhaledStyles.textStyle(
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
