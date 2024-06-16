import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/utilis/app_khaled_styles.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/presentation/widgets/line_widget.dart';
import 'package:graduation_project/features/profile/data/models/contact_us_model.dart';
import 'package:graduation_project/features/profile/presentation/cubits/contact_us_cubit/contact_us_bloc_cubit.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUsItem extends StatelessWidget {
  const ContactUsItem({super.key, required this.contactUsModel, required this.contactUsList});


  final ContactUSModel contactUsModel;

  final List<ContactUSModel>contactUsList;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsBloc(),

      child: BlocBuilder<ContactUsBloc,ContactUsBlocState>(
        builder: (context, state) {
          final contactUSBloc=BlocProvider.of<ContactUsBloc>(context);
          return GestureDetector(
            onTap: ()
            {
              contactUSBloc.changeContainerShape();


            },
            child: Container(
              width: 300.w,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                      color: AppColors.grey.withOpacity(.5),
                    width: 2.w
                  )
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      SizedBox(width: 15.w,),
                      SizedBox(
                          width: 25.w,
                          height: 25.h,
                          child: SvgPicture.asset(
                            contactUsModel.image, color: AppColors.primary,)),
                      SizedBox(width: 10.w,),
                      ResuableText(text: contactUsModel.text,
                      ),
                      Spacer(),
                      contactUSBloc.containerISOpen==false ?
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.primary,)
                          :
                      Icon(Icons.keyboard_arrow_up, color: AppColors.primary,),
                      SizedBox(width: 10.w,),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  if(contactUSBloc.containerISOpen == true)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h,),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 15.w, end: 15.w, bottom: 5.h),
                          child: LineWidget(
                            height: 2,
                            color: AppColors.grey.withOpacity(.5)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 35.w, bottom: 5.h,end: 20.w,top: 5.h),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 5.w,
                                  height: 5.h,
                                  child: Image.asset(
                                    ImageConstants.roundPointCommunityImage,
                                    color: AppColors.primary,)),
                              SizedBox(width: 10.w,),
                              Expanded(
                                child: Text(contactUsModel.subText,
                                  style: AppKhaledStyles.textStyle(
                                      size: 13,
                                      weight: FontWeight.normal
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),


                ],
              ),

            ),
          );
        },
      ),
    );
  }
}
