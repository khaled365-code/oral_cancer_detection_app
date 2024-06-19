import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';

import '../../../../core/commons/functions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../cubits/questions_cubit/question_diagnosis_cubit.dart';

class ResultRowButtons extends StatelessWidget {
  const ResultRowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 60.w),
      child: Row(
        children: [
          CustomElevatedButton(
            buttonBackground: AppColors.primary,
            onpress: (){
              navigate(context: context, route: Routes.home);
            }, child:  Text("BackToHome".tr(context)),),
          SizedBox(width: 30.w,),
          CustomElevatedButton(
            buttonBackground: AppColors.primary,
            onpress: (){
              BlocProvider.of<QuestionDiagnosisCubit>(context).navigationToLearnMore(context);
            },
            child:  Text("Learn More"),),
        ],
      ),
    );
  }
}
