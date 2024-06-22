import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';

class DiagnosisIntro extends StatelessWidget {
  const DiagnosisIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w ,vertical: 12.h ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: CustomContainer(conHeight:180.h, conWidth: 210.w, conImage:ImageConstants.diagnosisIntro)),
              SizedBox(height: 12.h,),
              Text('Check  your Symptoms',style: AppTextStyles.font20.copyWith(
                color: AppColors.primary,
              ),),
              SizedBox(height: 10.h,),
              Text('Take a short (5 min) symptom assessment,The '
                  'information you give  is safe and will not be shared.',
                style: AppTextStyles.font16.copyWith(fontWeight: FontWeight.w400,
                    color: AppColors.c8A8A8A ),),
              SizedBox(height: 14.h,),
              Text('Your result will include: ',style: AppTextStyles.font20.copyWith(
                color: AppColors.primary,
              ),),
              SizedBox(height: 12.h,),
             Row(
              children: [
                Padding(
                  padding:EdgeInsets.only(top: 5.h),
                  child:Image.asset(ImageConstants.roundPointCommunityImage),
                ),
                SizedBox(width: 10.w,),
                Flexible(child: Text("Possible Diagnosis based on  Symptoms",
                  style: AppTextStyles.font16.copyWith(fontWeight: FontWeight.w400,
                      color: AppColors.c8A8A8A ),)),
              ],
            ),
              SizedBox(height: 10.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child:Image.asset(ImageConstants.roundPointCommunityImage),
                  ),
                  SizedBox(width: 10.w,),
                  Flexible(child: Text("Recommendations on what to do next",
                    style: AppTextStyles.font16.copyWith(fontWeight: FontWeight.w400,
                        color: AppColors.c8A8A8A),)),
                ],
              ),
              SizedBox(height: 24.h,),
              Text("Note!!",style: AppTextStyles.font20.copyWith(
                color: AppColors.primary,
              ), ),
              SizedBox(height: 8.h,),
              Text("You must answer the questions accurately to get the correct result,"
                "This result is not definitive and it is important to consult"
                  "a doctor for further testing and evaluation to be fully sure...",
                style: AppTextStyles.font16.copyWith(fontWeight: FontWeight.w400,
                    color: AppColors.c8A8A8A), ),
              SizedBox(height:16.h,),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    navigate(context: context, route: Routes.UploadImageView);
                  },
                  child: Text(
                    "Continue...",
                    textAlign: TextAlign.right,
                    style: AppTextStyles.font18.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
