

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/core/widgets/shared_button.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/custom_app_bar.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_outlined_textfield.dart';
import '../manager/profile_cubites/update_profile_cubit.dart';


class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}
class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    context.read<UpdateProfileCubit>().initializeTextFields();
    super.initState();
  }


  final TextEditingController dateController=TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
  listener: (context, state) {
    if(state is UpdateProfileSuccessState){
      showSnackBar(context, content: state.message);
      navigate(context: context, route: Routes.profileScreen);
    }
    else if(state is UpdateProfileFailureState){
      showSnackBar(context, content: state.errMessage);
    }
  },
  builder: (context, state) {

    return Scaffold(


      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

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
                  title: Text('Profile',style: AppKhaledStyles.textStyle(color: AppColors.black,weight: FontWeight.bold,size: 15.sp),),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Stack(
                    clipBehavior: Clip.none,
                    children:[
                      state is UpdateProfilePictureState? Center(
                        child: Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.cE7ECF0,
                              image: DecorationImage(
                                image: FileImage(File(context.read<UpdateProfileCubit>().updatedProfilePic!.path)),
                              )
                          ),
                        ),
                      ):Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.cE7ECF0,
                            image: DecorationImage(
                              image: AssetImage(ImageConstants.ProfileUserImage),
                            )
                        ),
                      ),
                      PositionedDirectional(
                        bottom: -7.h,
                        end: -2.w,
                        child: Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: IconButton(icon: Icon(Icons.camera_alt_outlined,color: AppColors.white,),
                            onPressed: () {
                              imagePick(imageSource: ImageSource.gallery)
                                  .then((value) =>
                                  context.read<UpdateProfileCubit>().uploadProfilePic(uploadedProfilePic: value!));
                            },
                          ),
                        ),
                      ),

                    ]
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
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 20.w,end:  20.w),
                child: CustomOutlinedTextField(

                  controller: TextEditingController(),
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
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 20.w,end:  20.w),
                child: CustomOutlinedTextField(

                  controller: TextEditingController(),
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

                  controller: TextEditingController(),
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

                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,),
              ),
              Spacer(),

              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 10.h,start: 20.w,end: 20.w),
                child: SharedButton(
                    height: 50,

                    onPressed: ()
                    {

                    },
                    hasBorderRadius: true,
                    borderRadiusValue: 30,
                    btnText: 'Update Profile',
                    btnTextStyle: AppKhaledStyles.textStyle(color: AppColors.white,weight: FontWeight.bold,size: 16.sp),
                    buttonColor: AppColors.primary)
                ,),

            ],
          ),
        ),
      ),

      );
  },
);

  }
}
/*
SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsetsDirectional.only(top: 20.h,start: 15.w,end: 15.w,bottom: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children:[
                   state is UpdateProfilePictureState? Center(
                    child: Container(
                      child: CircleAvatar(
                      radius: 70.r,
                     backgroundImage: FileImage(File(context.read<UpdateProfileCubit>().updatedProfilePic!.path)),
                    ),
                  ),
                   ):Center(
                      child: Container(
                        child: CircleAvatar(
                          backgroundColor: AppColors.light,
                          radius: 70.r,
                          backgroundImage: AssetImage(ImageConstants.ProfileUserImage),
                        ),
                      ),
                    ),
                    Positioned(right: 110,top: 100,
                      child: Container(
                      child: CircleAvatar(
                        radius: 22.r,
                        child: IconButton(icon: Icon(Icons.camera_alt_outlined),
                          onPressed: () {
                            imagePick(imageSource: ImageSource.gallery)
                                .then((value) =>
                                context.read<UpdateProfileCubit>().uploadProfilePic(uploadedProfilePic: value!));
                          },
                        ),
                      ),
                    ),
                    ),

                  ]
                ),
                SizedBox(height: 30.h,),
                CustomOutlinedTextField(
                  controller: context.read<UpdateProfileCubit>().updatedName,
                  hintText: 'fname'.tr(context),
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 20.h,),
                // CustomOutlinedTextField(
                //   hintText: 'lname'.tr(context),
                //   onFieldSubmitted: (value) {},
                //   hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                //   crusorColor: Colors.green,
                // ),
                // SizedBox(height: 30.h,),
                // CustomOutlinedTextField(
                //   hintText: 'phone'.tr(context),
                //   onFieldSubmitted: (value) {},
                //   hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                //   crusorColor: Colors.green,
                // ),
                //SizedBox(height: 30.h,),
                CustomOutlinedTextField(
                  controller: context.read<UpdateProfileCubit>().updatedEmail,

                  hintText: 'email'.tr(context),
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 30.h,),
                // CustomDatePicker(
                //   child: TextFormField(
                //     readOnly: true,
                //     controller: dateController,
                //     onTap: () async {
                //       DateTime? pickedDate = await showDatePicker(
                //         context: context,
                //         initialDate: DateTime.now(),
                //         firstDate: DateTime(2000),
                //         lastDate: DateTime(2100),
                //       );
                //       if (pickedDate != null) {
                //         String formattedDate =
                //         DateFormat("yyyy-MM-dd").format(pickedDate);
                //         setState(
                //               () {
                //             dateController.text = formattedDate.toString();
                //           },
                //         );
                //       }
                //     },
                //     style: AppTextStyles.font16.copyWith(
                //         fontWeight: FontWeight.normal, color: AppColors.black),
                //     decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.date_range),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(16.r),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 40.h,),
               state is UpdateProfileLoadingSate?Center(child: CircularProgressIndicator()): Padding(
                 padding:  EdgeInsetsDirectional.all(16),
                 child: SharedButton(
                      text: 'save'.tr(context),
                      textStyle: AppTextStyles.font20.copyWith(color: AppColors.black),
                      buttonColor: AppColors.primary,
                      hasBorderRadius: true ,
                      borderRadiusValue: 16.r,
                   onPressed: (){
                        context.read<UpdateProfileCubit>().updateProfile();


                   },

                  ),
               ),
            ],
            ),
          ),
        )




 */


