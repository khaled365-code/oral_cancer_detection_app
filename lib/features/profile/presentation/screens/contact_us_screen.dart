

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/profile/data/profile_models/contact_us_model.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../components/contact_us_item.dart';
import '../manager/contact_us_cubit/contact_us_bloc_cubit.dart';

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: BlocBuilder<ContactUsBloc, ContactUsBlocState>(
    builder: (context, state) {
    final contactUSBloc=BlocProvider.of<ContactUsBloc>(context);
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
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
                title: Text('Contact Us',style: AppKhaledStyles.textStyle(color: AppColors.black,weight: FontWeight.bold,size: 15.sp),),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsetsDirectional.only(start: 20.w,end: 20.w,top: 20.h),
                  itemBuilder: (context, index) => ContactUsItem(
                    contactUsModel: contactUSBloc.contactUsList[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 20.h,),
                  itemCount: 5),
            )


          ],
        ),
      ),
    );
  },
),

    );
  }
}
