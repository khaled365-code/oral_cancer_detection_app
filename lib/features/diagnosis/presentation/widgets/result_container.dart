import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/app_localization.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../cubits/questions_cubit/question_diagnosis_cubit.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  BoxDecoration(
        //border: Border.all(color: AppColors.primary,width: 2),
        color: AppColors.background,
        // gradient: LinearGradient(colors: [AppColors.background,AppColors.primary],begin: Alignment.topLeft,end: Alignment.bottomRight),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r),topRight: Radius.circular(16.r),bottomLeft: Radius.circular(16.r)),

      ),
      child:  Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(child: Text("TestResult".tr(context),style: AppTextStyles.font24,)
            // ),
            // SizedBox(height: 40.h,),
            Row(
              children: [
                Text("DiseaseName".tr(context),style: AppTextStyles.font18),
                Flexible(
                  child: Text(BlocProvider.of<QuestionDiagnosisCubit>(context).ConvertToDiseaseName(context),style: AppTextStyles.font18,
                    //overflow:TextOverflow.clip ,
                    //maxLines: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Text('Classification:'.tr(context),
                  style:AppTextStyles.font18 ,textAlign: TextAlign.center,),
                Text(BlocProvider.of<QuestionDiagnosisCubit>(context).ConvertToClassName(context),style: AppTextStyles.font18,
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Text('Image Classification: ',
                  style:AppTextStyles.font18 ,textAlign: TextAlign.center,),
                Text(CacheHelper().getData(key: "imageClassify"),style: AppTextStyles.font18,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
