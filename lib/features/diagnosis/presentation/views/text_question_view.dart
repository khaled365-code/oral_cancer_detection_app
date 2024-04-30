// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graduation_project/core/localization/app_localization.dart';
// import 'package:graduation_project/core/utilis/app_text_styles.dart';
// import 'package:graduation_project/features/auth/presentation/views/componants/custom_form_container.dart';
//
// import '../../../../core/utilis/colors.dart';
// import '../../../../core/widgets/custom_textformfield.dart';
//
// class QuestionText extends StatelessWidget {
//   const QuestionText({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding:  EdgeInsetsDirectional.all(8.0),
//         child: CustomFormContainer(
//           borderRadius:  BorderRadius.all(Radius.circular(40.r)),
//           width: double.infinity,
//           height: 500.h,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                  //Text("2 /9",style: AppTextStyles.font18.copyWith(color: AppColors.primary)),
//                  SizedBox(height: 30.h,),
//                  Text(" Whatisthesizeofulcer?".tr(context),style: AppTextStyles.font24.copyWith(color: AppColors.white),),
//
//                  SizedBox(height: 20.h,),
//                 Padding(
//                   padding:  EdgeInsetsDirectional.all(16.0),
//                   child: CustomTextFormField(hintText: 'Enterthesize'.tr(context),onChangeee: (data){},obscureValue: false,inputType: TextInputType.number,),
//                 )
//                 ,
//                  SizedBox(height: 40.h,),
//                 // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 //   children: [
//                 //     CustomElevatedButton( onpress: (){},buttonBackground: AppColors.primary, child: const Row(children: [Icon(Icons.arrow_back_outlined),Text("Back")],),),
//                 //     CustomElevatedButton( onpress: (){
//                 //       navigate(context: context, route: Routes.result);
//                 //     },
//                 //     buttonBackground: AppColors.primary, child:  const Row(children: [Text("Next"),Icon(Icons.arrow_forward),]),)
//                 //   ],
//                 // )
//               ],),
//           ),
//         ),
//       ),
//     );
//   }
// }
