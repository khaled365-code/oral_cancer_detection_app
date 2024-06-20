import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_text_button.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/diagnosis/presentation/cubits/image_cubit/image_diagnosis_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubits/image_diagnosis_cubit/upload_image_cubit.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/commons/functions.dart';
import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/widgets/shared_button.dart';
import '../cubits/image_diagnosis_cubit/upload_image_state.dart';


class UploadImageBody extends StatelessWidget {
  const UploadImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (BuildContext context, Object? state) {
          if (state is UploadImageFailure) {
            showSnackBar(context, content: state.errMessage,
                contentColor: AppColors.primary);
          }
        },
        builder: (BuildContext context, state) {
          final uploadImageCubit = BlocProvider.of<UploadImageCubit>(context);
          return Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w,top: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                        "Upload the image of the impaired tissue in your mouth",
                        textStyle: AppTextStyles.font20.copyWith(
                          color: AppColors.primary,),
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 100)
                    ),
                  ],
                  totalRepeatCount: 1,
                  stopPauseOnTap: true,
                  displayFullTextOnTap: true,
                ),
                SizedBox(height: 30.h,),
                uploadImageCubit.mouthImage == null ?
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.65,
                  color: AppColors.white,
                  child: Column(
                    children: [
                      DottedBorder(
                          color: AppColors.cCACACA,
                          strokeWidth: 1,
                          dashPattern: const [12, 5],
                          padding: EdgeInsets.only(top: 20.h,
                              bottom: 35.h,
                              left: 20.w,
                              right: 20.w),
                          child: GestureDetector(
                            onTap: () async
                            {
                              imagePick(imageSource: ImageSource.gallery)
                                  .then((value) {
                                uploadImageCubit.uploadMouthImage(
                                    tissueImg: value!);
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 55.w,
                                  height: 55.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.cF5F5F5,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.upload_file_outlined,
                                      color: AppColors.primary,
                                      size: 25.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Click to Upload',
                                      style: AppKhaledStyles.textStyle(
                                        weight: FontWeight.bold,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    Text(
                                      ' mouth image',
                                      style: AppKhaledStyles.textStyle(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Spacer(),
                      GestureDetector(
                        onTap: ()
                        {
                          navigate(context: context, route: Routes.diagnosisInstructionsScreen);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                           Icon(Icons.error_outline,color: AppColors.primary,),
                           SizedBox(width: 5.w,),
                           ResuableText(
                               text: 'View instructions',
                             color: AppColors.primary,
                             fontSize: 15,
                             fontWeight: FontWeight.w500
                           )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),
                    ],
                  ),
                ) :
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.65,
                  child: Column(
                    children: [
                      Container(
                        height: 200.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(File(uploadImageCubit
                                  .mouthImage!
                                  .path)),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Spacer(),
                      SharedButton(
                        onPressed: () {
                          uploadImageCubit.deleteMouthImage();
                        },
                        btnText: 'Remove',
                        width: double.infinity,
                        height: 50,
                        borderRadiusValue: 6,
                        hasBorderRadius: true,
                        btnTextStyle: AppTextStyles.font16.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500) ,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      BlocListener<ImageDiagnosisCubit, ImageDiagnosisState>(
                        listener: (context, state)
                        {
                        if(state is ImageDiagnosisFailureState)
                        {
                          showSnackBar(context, content: state.errMessage, contentColor: AppColors.primary);
                        }
                            else if(state is ImageDiagnosisSuccessState)
                            {
                                navigate(context: context, route: Routes.questionsView);
                             }
                        },
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: CustomTextButton(
                            textState: 'NEXT',
                            bIcon: const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,),
                            onPressed: ()
                            {
                              BlocProvider.of<ImageDiagnosisCubit>(
                                  context).imageDiagnosis(context);
                            },),
                        ),
                      ),
                    ],
                  ),
                ),



                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     CustomTextButton(
                //         textState: 'UPLOAD',
                //         bIcon: const Icon(Icons.upload, color: Colors.white,),
                //         onPressed: () {
                //           imagePick(imageSource: ImageSource.gallery)
                //               .then((value) => context.read<UploadImageCubit>().uploadMouthImage(tissueImg: value!));
                //         }),
                //     BlocListener<ImageDiagnosisCubit, ImageDiagnosisState>(
                //       listener: (context, state) {
                //         if(state is ImageDiagnosisFailureState){
                //           showSnackBar(context,content: state.errMessage,contentColor: AppColors.primary);
                //         }
                //         else if(state is ImageDiagnosisSuccessState){
                //           navigate(context: context, route: Routes.questionsView);
                //         }
                //       },
                //       child: CustomTextButton(
                //         textState: 'NEXT',
                //         bIcon: const Icon(
                //           Icons.arrow_forward_rounded, color: Colors.white,),
                //         onPressed: () {
                //           BlocProvider.of<ImageDiagnosisCubit>(context).imageDiagnosis(context);
                //
                //         },),
                //     ),
                //   ],
                // ),
              ],
            ),
          );
        }

    );
  }
}
