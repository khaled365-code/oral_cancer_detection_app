


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/shared_button.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_outlined_textfield.dart';
import '../../../../core/widgets/date_picker_widget.dart';
import '../../../../generated/l10n.dart';
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
          title: S.of(context).profile,
        ),
        preferredSize: Size(double.infinity, 50),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: 20,left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(AppAssets.profilePic),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                CustomOutlinedTextField(
                  hintText: S.of(context).fname,
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 30,),
                CustomOutlinedTextField(
                  hintText: S.of(context).lname,
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 30,),
                CustomOutlinedTextField(
                  hintText: S.of(context).phone,
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 30,),
                CustomOutlinedTextField(
                  hintText: S.of(context).email,
                  onFieldSubmitted: (value) {},
                  hintStyle: AppTextStyles.font16.copyWith(fontWeight: FontWeight.normal,color: AppColors.black),
                  crusorColor: Colors.green,
                ),
                SizedBox(height: 30,),
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
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                SharedButton(
                    text: S.of(context).save,
                    textStyle: AppTextStyles.font20.copyWith(color: AppColors.black),
                    buttonColor: AppColors.primary,
                    hasBorderRadius: true ,
                    borderRadiusValue: 16,

                ),
            ],
            ),
          ),
        ),

      );

  }
}


