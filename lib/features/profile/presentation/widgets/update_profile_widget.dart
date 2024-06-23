import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:graduation_project/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/commons/functions.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/fontweight_helper.dart';
import '../../../../core/utilis/image_constants.dart';
import '../../../../core/widgets/custom_image_picker.dart';
import '../../../../core/widgets/resuable_text.dart';

class UpdateProfileWidget extends StatelessWidget {
  const UpdateProfileWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(profileRepo: ProfileRepoImplementation(api: DioConsumer(dio: Dio(), isTextModel: false, isImageModel: false))),
      child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          final updateProfileCubit = BlocProvider.of<UpdateProfileCubit>(
              context);
          return AlertDialog(
              contentPadding: EdgeInsetsDirectional.only(bottom: 10.h),
              actionsPadding: EdgeInsetsDirectional.zero,
              titlePadding: EdgeInsetsDirectional.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              content: Padding(
                padding: EdgeInsetsDirectional.only(top: 5.h, start: 10.h, end: 10.w),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ResuableText(
                          text: 'Update This Profile',
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        updateProfileCubit.updatedProfilePic==null?
                        Center(
                          child: CustomImagePickerAvatar(
                            fitState: BoxFit.contain,
                            hasBottom: true,
                            hasEnd: true,
                            image: AssetImage(ImageConstants.userDefaultImage),
                            cameraOnTap: ()
                            {
                              imagePick(imageSource: ImageSource.camera).then((value) =>
                                  updateProfileCubit.uploadProfilePic(uploadedProfilePic: value!));
                              Navigator.pop(context);

                            },
                            galleryOnTap: () async
                            {
                              imagePick(imageSource: ImageSource.gallery).then((value) =>
                                  updateProfileCubit.uploadProfilePic(uploadedProfilePic: value!));

                              Navigator.pop(context);

                            },
                          ),
                        ):
                        Center(
                          child: CustomImagePickerAvatar(
                            hasBottom: true,
                            hasEnd: true,
                            image: FileImage(File(updateProfileCubit.updatedProfilePic!.path)),
                            cameraOnTap: ()
                            {
                              imagePick(imageSource: ImageSource.camera).then((value) =>
                                  updateProfileCubit.uploadProfilePic(uploadedProfilePic: value!));
                              Navigator.pop(context);
                            },
                            galleryOnTap: ()
                            {
                              imagePick(imageSource: ImageSource.gallery).then((value) =>
                                  updateProfileCubit.uploadProfilePic(uploadedProfilePic: value!));

                              Navigator.pop(context);

                            },
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        const ResuableText(
                          text: 'add new name',
                          color: AppColors.primary,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: updateProfileCubit.nameController,
                          cursorColor: AppColors.primary,
                          decoration:
                           InputDecoration(
                             contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primary
                              )
                            ),
                            focusedBorder:OutlineInputBorder(
                           borderSide: BorderSide(
                           color: AppColors.primary
                           )
                        ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const ResuableText(
                          text: 'add new email',
                          color: AppColors.primary,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: updateProfileCubit.emailController,
                          cursorColor: AppColors.primary,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsetsDirectional.only(start: 10.w),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primary
                                )
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primary
                                )
                          ),
                        ),
                                              ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ResuableText(
                                text: 'Cancel',
                                fontSize: 13,
                                fontWeight: FontWeightHelper.regular,
                                color: AppColors.c141619,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            GestureDetector(
                              onTap: ()
                              {
                                if(updateProfileCubit.nameController.text=='' &&
                                    updateProfileCubit.emailController.text==''&&
                                    updateProfileCubit.updatedProfilePic==null&&
                                    updateProfileCubit.dateOfBirthController.text==''&&
                                    updateProfileCubit.genderController.text==''&&
                                    updateProfileCubit.phoneController.text=='')
                                {
                                  showToast(msg: 'No changes to update', toastStates: ToastStates.error);
                                }

                                else if(updateProfileCubit.nameController.text!=''&& updateProfileCubit.emailController.text!='')
                                {
                                  updateProfileCubit.updateProfileFun(
                                      name: updateProfileCubit.nameController.text,
                                      email: updateProfileCubit.emailController.text,
                                      updatedPhoto: updateProfileCubit.updatedProfilePic
                                  );
                                }
                                else if(updateProfileCubit.nameController.text==''&& updateProfileCubit.emailController.text!='')
                                {
                                  updateProfileCubit.updateProfileFun(
                                      email: updateProfileCubit.emailController.text,
                                      updatedPhoto: updateProfileCubit.updatedProfilePic
                                  );
                                }
                                else if(updateProfileCubit.emailController.text==''&& updateProfileCubit.nameController.text!='')
                                {
                                  updateProfileCubit.updateProfileFun(
                                      name: updateProfileCubit.nameController.text,
                                      updatedPhoto: updateProfileCubit.updatedProfilePic
                                  );
                                }
                                else
                                {
                                  updateProfileCubit.updateProfileFun(
                                      updatedPhoto: updateProfileCubit.updatedProfilePic
                                  );
                                }
                              },
                              child: ResuableText(
                                text: 'Update',
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),



                      ]),
                ),
              ),

          );
        },
      ),
    );
  }
}