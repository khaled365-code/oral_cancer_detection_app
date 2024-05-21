import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/custom_container.dart';
import 'package:graduation_project/core/widgets/custom_text_button.dart';
import 'package:graduation_project/features/home/presentation/manager/upload_image_cubit.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/commons/functions.dart';


class UploadImageBody extends StatelessWidget {
  const UploadImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit , UploadImageState>(
      builder: (context, state) {
       
        return Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: 18.w, vertical: 8.h),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 32.h,),
              const Text(
                'Upload the image of the impaired tissue in your mouth',
                textAlign: TextAlign.center,),
              SizedBox(height: 20.h,),
              state is UploadImageSuccess && context.read<UploadImageCubit>().mouthImage != null?
              UImageContainer(
                  conHeight: 240.h, conWidth: 210.w, conImage:FileImage(File(context.read<UploadImageCubit>().mouthImage!.path ))
              ):
             CustomContainer( conHeight: 240.h, conWidth: 210.w,
               conImage: ImageConstants.empty,borderRadius:BorderRadius.circular(16),
               border: Border.all(
                 color:AppColors.primary,
                 width: 2.0,
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
                  //const SizedBox(width:16,),
                  CustomTextButton(
                    textState: 'NEXT',
                    bIcon: const Icon(
                      Icons.arrow_forward_rounded, color: Colors.white,),
                    onPressed: () {
                      navigate(context: context, route: Routes.questionsView);
                    },),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
