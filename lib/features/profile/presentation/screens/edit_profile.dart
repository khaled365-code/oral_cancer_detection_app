

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
import 'package:graduation_project/core/widgets/shared_button.dart';
import 'package:graduation_project/core/widgets/snackbar.dart';
import 'package:graduation_project/features/profile/presentation/manager/profile_cubites/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/manager/profile_cubites/update_profile_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_outlined_textfield.dart';
import '../../../../core/widgets/date_picker_widget.dart';


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

      appBar: PreferredSize(
        child: CustomAppBar(
          title: 'editProfile'.tr(context),
        ),
        preferredSize: Size(double.infinity, 50.h),
      ),
      body: SingleChildScrollView(
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
                          radius: 70.r,
                          backgroundImage: AssetImage(ImageConstants.profilePic),
                        ),
                      ),
                    ),
                    Positioned(right: 110,top: 100,
                      child: Container(
                      child: CircleAvatar(
                        radius: 22.r,
                        child: IconButton(icon: Icon(Icons.camera_alt_outlined),
                          onPressed: () {
                            ImagePicker().pickImage(source: ImageSource.gallery)
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
        ),

      );
  },
);

  }
}


