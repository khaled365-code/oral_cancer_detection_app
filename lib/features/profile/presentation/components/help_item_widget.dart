import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
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
                  width: 300.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        topRight: Radius.circular(8.r),

                      ),
                      border: helpScreenCubit.containerISOpen==false? Border.all(
                          color: AppColors.cEFF0F3
                      ):Border(
                        top: BorderSide(color: AppColors.cEFF0F3),
                        left: BorderSide(color: AppColors.cEFF0F3),
                        right: BorderSide(color: AppColors.cEFF0F3),
                      )
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w,),
                      ResuableText(text: helpModel.text),
                      Spacer(),
                      helpScreenCubit.containerISOpen == false ?
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.primary,)
                          :
                      Icon(Icons.keyboard_arrow_up, color: AppColors.primary,),
                      SizedBox(width: 10.w,),

                    ],
                  ),
                ),
              ),
              if(helpScreenCubit.containerISOpen==true)
                Container(
                   width: 300.w,
                   height: 50.h,
                   decoration: BoxDecoration(
                       color:  AppColors.white,
                       borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(8.r),
                         bottomRight: Radius.circular(8.r),
                       ),
                       border: Border(
                          bottom: BorderSide(color: AppColors.primary),
                         left: BorderSide(color: AppColors.primary),
                         right: BorderSide(color: AppColors.primary),

                       )
                   ),
                   child: Padding(
                     padding:EdgeInsetsDirectional.only(top: 10.h,start: 10.w,),
                     child: Text('answerText',style: AppKhaledStyles.textStyle(
                       size: 14,
                       weight: FontWeight.normal
                     )),
                   ),
                 )
            ],
          );
        },
      ),
    );
  }
}
