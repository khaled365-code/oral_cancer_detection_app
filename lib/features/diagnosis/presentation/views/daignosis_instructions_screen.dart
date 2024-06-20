




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';

import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../data/models/instructions_builder_data_model/instructions_builder_data_model.dart';
import '../widgets/instructions_widget_builder.dart';

class DiagnosisInstructionsScreen extends StatelessWidget {


  List<InstructionsBuilderDataModel>instructionsBuilderDataModel = [
    InstructionsBuilderDataModel('Snap', image: ImageConstants.photoInstructionsImage, instructionText: 'Take one clear photo of your impaired tissue'),
    InstructionsBuilderDataModel('Answer', image: ImageConstants.photoInstructionsImage, instructionText: 'Answer all questions correctly'),
    InstructionsBuilderDataModel('Review', image: ImageConstants.photoInstructionsImage, instructionText: 'Review your result & share it in community'),
    InstructionsBuilderDataModel('Save', image: ImageConstants.photoInstructionsImage, instructionText: 'Save the result in your medical record'),
    InstructionsBuilderDataModel('Visit', image: ImageConstants.photoInstructionsImage, instructionText: 'Visit your medical record history'),


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.primary,),
        ),
        title: ResuableText(
            text: 'instructions',
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold
        ),
      ),
      body: Column(
        children:
        [
          LineWidget(
            height: 2,
          ),
          SizedBox(height: 20.h,),
          Container(
            height: MediaQuery.of(context).size.height*.7,
            child: PageView.builder(
              onPageChanged: (index)
              {

              },
                itemBuilder: (context, index) => InstructionsWidgetBuilder(
                  currentIndex: index,
                  instructionsBuilderDataModel: instructionsBuilderDataModel[index],
                ),
              itemCount: instructionsBuilderDataModel.length,
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: SharedButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
              btnText: 'Start a new case',
              width: double.infinity,
              buttonColor: AppColors.primary,
              height: 50,
              borderRadiusValue: 6,
              hasBorderRadius: true,
              btnTextStyle: AppTextStyles.font16.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500) ,
            ),
          ),

        ],
      ),
    );
  }
}
