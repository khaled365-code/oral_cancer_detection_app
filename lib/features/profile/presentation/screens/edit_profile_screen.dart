

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/widgets/custom_image_picker.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/core/widgets/shared_button.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/commons/global_cubits/get_profile_data_cubit/profile_cubit.dart';
import '../../../../core/utilis/app_styles.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../../../../core/widgets/custom_outlined_textfield.dart';
import '../manager/update_profile_cubit/update_profile_cubit.dart';


class EditProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<GetProfileDataCubit, GetProfileDataCubitState>(
  listener: (context, getProfileState)
  {
    // TODO: implement listener
  },
  builder: (context, getProfileState) {
    final getProfileCubit=BlocProvider.of<GetProfileDataCubit>(context);
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
  listener: (context, updateState) {
    if(updateState is UpdateProfileSuccessState)
    {
      showSnackBar(context, content: updateState.message);
      navigate(context: context, route: Routes.profileScreen);
    }
    else if(updateState is UpdateProfileFailureState){
      showSnackBar(context, content: updateState.errMessage);
    }
  },
  builder: (context, updateState) {
    final updateProfileCubit=BlocProvider.of<UpdateProfileCubit>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsetsDirectional.only(top: 40.h,start: 15.w,end: 25.w),
              child: BodyAppBar(
                hasLeading: true,
                hasTitle: true,
                leading: GestureDetector(
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.cEFF0F3,
                            width: 2.w
                        )
                    ),
                    child: Icon(Icons.arrow_back_outlined,size: 20.sp,),
                  ),
                ) ,
                title: Text('Profile',style: AppKhaledStyles.textStyle(color: AppColors.black,weight: FontWeight.bold,size: 16),),
              ),
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
                image: AssetImage(ImageConstants.ProfileUserImage),
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
                  imagePick(imageSource: ImageSource.camera);
                },
                galleryOnTap: ()
                {
                  imagePick(imageSource: ImageSource.gallery);

                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),


            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,),
              child: ResuableText(
                text: 'Name',
                fontSize: 12,
                color: AppColors.c353535,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),

            getProfileState is ProfileSuccess ?
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,end:  20.w),
              child: CustomOutlinedTextField(
                hintText: getProfileState.userProfile.name,
                controller: updateProfileCubit.nameController,
                keyboardType: TextInputType.text,),
            ):
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,end:  20.w),
              child: CustomOutlinedTextField(
                controller: updateProfileCubit.nameController,
                keyboardType: TextInputType.text,),
            ),


            SizedBox(
              height: 10.h,
            ),



            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,),
              child: ResuableText(
                text: 'Phone Number',
                fontSize: 12,
                color: AppColors.c353535,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,end:  20.w),
              child: CustomOutlinedTextField(

                controller: updateProfileCubit.phoneController,
                keyboardType: TextInputType.text,),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,),
              child: ResuableText(
                text: 'Email',
                fontSize: 12,
                color: AppColors.c353535,
              ),
            ),


            SizedBox(
              height: 5.h,
            ),


            getProfileState is ProfileSuccess?
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,end:  20.w),
              child: CustomOutlinedTextField(
                hintText: getProfileState.userProfile.email,
                controller: updateProfileCubit.emailController,
                keyboardType: TextInputType.emailAddress,),
            ):
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,end:  20.w),
              child: CustomOutlinedTextField(
                controller: updateProfileCubit.emailController,
                keyboardType: TextInputType.emailAddress,),
            ),


            SizedBox(
              height: 10.h,
            ),


            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,),
              child: ResuableText(
                text: 'DOB',
                fontSize: 12,
                color: AppColors.c353535,
              ),
            ),


            SizedBox(
              height: 5.h,
            ),


            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,end:  20.w),
              child: CustomOutlinedTextField(
                inputFormatters: [
                  // Format the text input as a date (e.g., 'MM/dd/yyyy')
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                  LengthLimitingTextInputFormatter(10),
                  // Use the desired date format mask
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final newText = newValue.text;
                    if (newText.length == 2 || newText.length == 5) {
                      return TextEditingValue(
                        text: newText + '/',
                        selection: TextSelection.collapsed(offset: newText.length + 1),
                      );
                    }
                    return newValue;
                  }),
                ],
                controller: updateProfileCubit.dateOfBirthController,
                keyboardType: TextInputType.text,),
            ),

            SizedBox(
              height: 10.h,
            ),

            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,),
              child: ResuableText(
                text: 'Gender',
                fontSize: 12,
                color: AppColors.c353535,
              ),
            ),

            SizedBox(
              height: 5.h,
            ),


            Padding(
              padding:  EdgeInsetsDirectional.only(start: 20.w,end:  20.w),
              child: CustomOutlinedTextField(

                controller: updateProfileCubit.genderController,
                keyboardType: TextInputType.text,),
            ),


           // Spacer(),


            Padding(
              padding: EdgeInsetsDirectional.only(top: 70.h,start: 20.w,end: 20.w),
              child: SharedButton(
                  height: 50,
                  width: 510,
                  onPressed: ()
                  {
                    updateProfileCubit.updateProfile();
                  },
                  hasBorderRadius: true,
                  borderRadiusValue: 30,
                  btnText: 'Update Profile',
                  btnTextStyle: AppKhaledStyles.textStyle(color: AppColors.white,weight: FontWeight.bold,size: 16.sp),
                  buttonColor: AppColors.primary)
              ,),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    
      );
  },
);
  },
);

  }
}


