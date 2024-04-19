


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/shared_button.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_outlined_textfield.dart';
import '../../../../core/widgets/date_picker_widget.dart';
import 'package:intl/intl.dart';


class EditProfileScreen extends StatefulWidget {

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  final TextEditingController dateController=TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: PreferredSize(
        child: CustomAppBar(
          title: 'S.of(context).profile',
        ),
        preferredSize: Size(double.infinity, 50.h),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsetsDirectional.only(top: 20.h,start: 15.w,end: 15.w,bottom: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: CircleAvatar(
                      radius: 70.r,
                      backgroundImage: AssetImage(ImageConstants.profilePic),
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                CustomOutlinedTextField(
                  hintText: 'S.of(context).fname',
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 30.h,),
                CustomOutlinedTextField(
                  hintText: 'S.of(context).lname',
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 30.h,),
                CustomOutlinedTextField(
                  hintText: 'S.of(context).phone',
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 30.h,),
                CustomOutlinedTextField(
                  hintText: 'S.of(context).email',
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 30.h,),
                CustomDatePicker(
                  child: TextFormField(
                    readOnly: true,
                    controller: dateController,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                        DateFormat("yyyy-MM-dd").format(pickedDate);
                        setState(
                              () {
                            dateController.text = formattedDate.toString();
                          },
                        );
                      }
                    },
                    style: AppTextStyles.font16.copyWith(
                        fontWeight: FontWeight.normal, color: AppColors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),
                SharedButton(
                    text: 'S.of(context).save',
                    textStyle: AppTextStyles.font20.copyWith(color: AppColors.black),
                    buttonColor: AppColors.primary,
                    hasBorderRadius: true ,
                    borderRadiusValue: 16.r,

                ),
            ],
            ),
          ),
        ),

      );

  }
}


