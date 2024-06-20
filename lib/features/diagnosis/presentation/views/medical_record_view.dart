import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/lotties_constants.dart';
import 'package:graduation_project/core/widgets/default_app_bar.dart';
import 'package:graduation_project/features/home/presentation/cubits/medical_records_cubits/get_medical_record_cubit.dart';
import 'package:graduation_project/features/home/presentation/widgets/mr_item.dart';
import 'package:lottie/lottie.dart';

class MedicalRecordView extends StatelessWidget {
  const MedicalRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalRecordCubit, MedicalRecordState>(
  listener: (context, state) {
   if(state is MedicalRecordFailure){
     showSnackBar(context,content:state.errMessage,contentColor: AppColors.primary);
   }
  },
  builder: (context, state) {
    return Scaffold(
      appBar:PreferredSize(preferredSize: Size(double.infinity, 40.h),
          child:DefaultAppBar(
            hasActions:false,hasTitle: true,hasLeading: false,title: Text('Medical Record'),
            backgroundColor: AppColors.primary,)),
       backgroundColor:AppColors.background,
       body:state is MedicalRecordSuccess? Padding(
         padding: EdgeInsets.symmetric(horizontal: 24.w ,vertical: 12.h),
         child: Column(
           mainAxisAlignment:  MainAxisAlignment.start,
           children: [
             SizedBox(height: 18.h,),
             Expanded(
               child: ListView.builder(
                   itemBuilder: (context,index){
                     return MedicalRecordItem(medicalRecordModel: BlocProvider.of<MedicalRecordCubit>(context).medicalRecordList[index],);
                   },
                   itemCount:BlocProvider.of<MedicalRecordCubit>(context).medicalRecordList.length
               ),
             )
           ],
         ),
       ): state is MedicalRecordLoading?
       Center(child: Lottie.asset(AppLoties.LoadingMedicalRecLottie))
           :Center(child: Lottie.asset(AppLoties.noDataFoundLottie))
     );
  },
);
  }
}

