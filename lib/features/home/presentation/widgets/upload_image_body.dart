import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_text_button.dart';
import 'package:graduation_project/features/diagnosis/presentation/cubits/image_cubit/image_diagnosis_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubits/image_diagnosis_cubit/upload_image_cubit.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/commons/functions.dart';
import '../cubits/image_diagnosis_cubit/upload_image_state.dart';


class UploadImageBody extends StatelessWidget {
  const UploadImageBody({super.key});
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<UploadImageCubit,UploadImageState>(
      listener: (BuildContext context, Object? state) {
        if(state is UploadImageFailure){
          showSnackBar(context,content: state.errMessage,contentColor: AppColors.primary);
        }
      },
        builder: (BuildContext context, state) {
          return  Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 12.w, vertical: 8.h),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 32.h,),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                            "Upload the image of the impaired tissue in your mouth",
                            textStyle:AppTextStyles.font20.copyWith(color: AppColors.primary,),
                            textAlign: TextAlign.center,
                            speed: const Duration(milliseconds: 100)
                        ),
                      ],
                      totalRepeatCount: 1,
                      stopPauseOnTap: true,
                      displayFullTextOnTap: true,
                    ),
                    SizedBox(height: 30.h,),
                    state is UploadImageSuccess && context.read<UploadImageCubit>().mouthImage != null?

                    UImageContainer(
                        conHeight: 240.h, conWidth: 350.w, conImage:FileImage(File(context.read<UploadImageCubit>().mouthImage!.path ))
                    ) :
                    CustomContainer( conHeight: 240.h, conWidth: 210.w,
                      conImage: ImageConstants.empty,borderRadius:BorderRadius.circular(16),
                      border: Border.all(
                        color:AppColors.primary,
                        width: 1.0,
                        style:BorderStyle.solid,
                      ),),
                    SizedBox(height: 50.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextButton(
                            textState: 'UPLOAD',
                            bIcon: const Icon(Icons.upload, color: Colors.white,),
                            onPressed: () {
                              imagePick(imageSource: ImageSource.gallery)
                                  .then((value) => context.read<UploadImageCubit>().uploadMouthImage(tissueImg: value!));
                            }),
                        BlocListener<ImageDiagnosisCubit, ImageDiagnosisState>(
                          listener: (context, state) {
                            if(state is ImageDiagnosisFailureState){
                              showSnackBar(context,content: state.errMessage,contentColor: AppColors.primary);
                            }
                            else if(state is ImageDiagnosisSuccessState){
                              navigate(context: context, route: Routes.questionsView);
                            }
                          },
                          child: CustomTextButton(
                            textState: 'NEXT',
                            bIcon: const Icon(
                              Icons.arrow_forward_rounded, color: Colors.white,),
                            onPressed: () {
                              BlocProvider.of<ImageDiagnosisCubit>(context).imageDiagnosis(context);

                            },),
                        ),
                      ],
                    ),
                  ],
                ),
              Positioned(
                  left: 295.w,
                  bottom: 85.h,
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: AppColors.primary,
                    child: IconButton(onPressed: (){
                      // BlocProvider.of<UploadImageCubit>(context).mouthImage==null;
                      BlocProvider.of<UploadImageCubit>(context).deleteMouthImage();

                    }, icon: Icon(Icons.delete,size: 33,color: AppColors.white,)),
                  )
              )
              ]
            ),
          );
        }

      );


  }
}
