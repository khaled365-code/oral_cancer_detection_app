
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_styles.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/core/widgets/shared_button.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';

class DeleteAccountwidget extends StatelessWidget {
  const DeleteAccountwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          Padding(
            padding:  EdgeInsetsDirectional.only(top: 15.h,start: 140.w,end: 140.w),
            child: Center(
              child: LineWidget(
                color: AppColors.cE6E6E6.withOpacity(.3),
                height: 2,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsetsDirectional.only(top: 25.h),
            child: ResuableText(text: 'Delete Account',
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(top: 15.h,start: 30.w,end: 30.w),
            child: Center(
              child: LineWidget(
                color: AppColors.cE7E7E7,
                height: 2,
              ),
            ),
          ),
          Spacer(),
          ResuableText(text: 'Are You Sure You Want to Delete Account?',
          fontSize: 11,
          fontWeight: FontWeight.normal,
          color:AppColors.grey ,),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 20.h,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                SharedButton(btnText: 'Cancel', onPressed: (){
                  Navigator.pop(context);
                },
                  hasBorderRadius: true,
                  borderRadiusValue: 25.r,
                  hasBorder: true,
                  height: 50,
                  buttonColor: AppColors.white,
                  btnTextStyle: AppKhaledStyles.textStyle(
                    color: AppColors.primary
                  ),
                ),
                SizedBox(width: 10.w,),
                SharedButton(btnText: 'Yes, Delete', onPressed: (){},
                  hasBorderRadius: true,
                  borderRadiusValue: 25.r,
                  height: 50,
                  btnTextStyle: AppKhaledStyles.textStyle(
                      color: AppColors.white
                  ),

                ),

              ],
            ),
          ),
          SizedBox(height: 20.h,),
        ])
    );
  }
}
