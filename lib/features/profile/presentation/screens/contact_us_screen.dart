

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/features/profile/presentation/cubits/contact_us_cubit/contact_us_bloc_cubit.dart';
import 'package:graduation_project/features/profile/presentation/widgets/contact_us_item.dart';
import '../../../../core/utilis/app_khaled_styles.dart';
import '../../../../core/widgets/body_app_bar.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';


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
                title: Text('Contact Us',style: AppKhaledStyles.textStyle(color: AppColors.black,weight: FontWeight.bold,size: 16),),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsetsDirectional.only(start: 20.w,end: 20.w,top: 20.h,bottom: 20.h),
                  itemBuilder: (context, index) => ContactUsItem(
                    contactUsList: contactUSBloc.contactUsList,
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
