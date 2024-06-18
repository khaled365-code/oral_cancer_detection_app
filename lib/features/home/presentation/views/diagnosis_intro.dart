import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_elevated_button.dart';
import 'package:graduation_project/features/diagnosis/presentation/widgets/learnmore_row_widget.dart';
import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'package:graduation_project/features/home/presentation/widgets/upload_image_body.dart';

class DiagnosisIntro extends StatelessWidget {
  const DiagnosisIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:12.w ,vertical: 12.h ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainer(conHeight: 130.h, conWidth: 150.w, conImage:ImageConstants.diagnosisIntro),
              SizedBox(height: 16.h,),
              Text('Check  your Symptoms',style: AppTextStyles.font20,),
              SizedBox(height: 10.h,),
              Text('Take a short (5 min) symptom assessment. The'
                  'information you give  is safe and will not be shared.',
                style: AppTextStyles.font16.copyWith(fontWeight: FontWeight.w300),),
              SizedBox(height: 8.h,),
              Text('Your result will include: ',style: AppTextStyles.font20,),
              LearnMoreRowWidget(text:"possible Diagnosis based on symptoms", isOneAnswer: true),
              LearnMoreRowWidget(text:"Recommendations on what to do next", isOneAnswer: true),
              CustomButton(buttonText:  "continue" , onTap:(){navigate(context: context,
                  route: Routes.UploadImageView);
                }
                ,),
            ],
          ),
        ),
      ),
    );
  }
}
