



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../generated/l10n.dart';

class FeedBackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: CustomAppBar(
          title: S.of(context).feedback,
        ),
      ),

      body:Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
            children: [
              Center(
                  child: Text(
                S.of(context).howrate,
                style: AppTextStyles.font16.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.normal),
              )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.star_border_purple500_outlined,
                    size: 50,
                    color: AppColors.primary,
                  ),
                ],
              ), //stars
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  children: [
                    Text(
                      S.of(context).poor,
                      style: AppTextStyles.font14.copyWith(
                          color: AppColors.grgr, fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Text(
                      S.of(context).excellent,
                      style: AppTextStyles.font14.copyWith(
                          color: AppColors.grgr, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ), //rating
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Divider(
                      thickness: 0,
                      color: AppColors.grgr,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).leavecomment,
                          style: AppTextStyles.font16
                              .copyWith(color: AppColors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          S.of(context).impfeed,
                          style: AppTextStyles.font16.copyWith(
                              color: AppColors.grgr,
                              fontWeight: FontWeight.normal),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      thickness: 0,
                      color: AppColors.grgr,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SharedButton(
                  text: S.of(context).sendfeedback,
                  buttonColor: AppColors.primary,
                  textStyle: AppTextStyles.font16.copyWith(
                    color: AppColors.white,
                  ),
                  width: double.infinity,
                  hasBorderRadius: true,
                  borderRadiusValue: 10,
                ),
              ),
            ],
          ),
        ),

    );

  }
}
