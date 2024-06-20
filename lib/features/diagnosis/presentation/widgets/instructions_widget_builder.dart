



import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/fontweight_helper.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/diagnosis/presentation/widgets/instructions_dot_container.dart';
import 'package:graduation_project/features/home/presentation/widgets/dot_container.dart';

import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../data/models/instructions_builder_data_model/instructions_builder_data_model.dart';

class InstructionsWidgetBuilder extends StatelessWidget {
  const InstructionsWidgetBuilder({super.key, required this.instructionsBuilderDataModel, required this.currentIndex});

final InstructionsBuilderDataModel instructionsBuilderDataModel;
final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
         SizedBox(
           width: 300.w,
             height: 300.h,
             child: Image.asset(ImageConstants.photoInstructionsImage,fit: BoxFit.scaleDown,)),
          SizedBox(height: 30.h,),
          ResuableText(
              text: instructionsBuilderDataModel.instructionTitle,
              color: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeightHelper.regular),
          SizedBox(height: 20.h,),
          ResuableText(
            text: instructionsBuilderDataModel.instructionText,
            color: AppColors.c929494,
            fontSize: 14,
            fontWeight: FontWeightHelper.regular
          ),
          SizedBox(height: 30.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
             ...List.generate(5,
             (index) => InstructionsDotContainer(

               indicatorIsActive: index==currentIndex,),)
            ],
          ),



        ]

    ));
  }
}
