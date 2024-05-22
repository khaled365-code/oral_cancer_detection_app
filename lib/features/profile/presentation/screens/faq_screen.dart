import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/profile/presentation/manager/faq_screen_cubit/faq_screen_cubit.dart';

import '../../../../core/utilis/app_styles.dart';
import '../../../../core/utilis/colors.dart';
import '../../../../core/widgets/body_app_bar.dart';
import '../components/faq_item_widget.dart';

class FaqScreen extends StatefulWidget {

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqScreenCubit, FaqScreenState>(
      builder: (context, state) {
        final faqCubit=BlocProvider.of<FaqScreenCubit>(context);
        return Scaffold(

          body: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 40.h, start: 15.w, end: 25.w),
                child: BodyAppBar(
                  hasLeading: true,
                  hasTitle: true,
                  leading: GestureDetector(
                    onTap: () {
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
                      child: Icon(Icons.arrow_back_outlined, size: 20.sp,),
                    ),
                  ),
                  title: Text('FAQ', style: AppKhaledStyles.textStyle(
                      color: AppColors.black,
                      weight: FontWeight.bold,
                      size: 16),),
                ),
              ),
              Expanded(

                child: ListView.separated(
                    padding: EdgeInsetsDirectional.only(
                    start: 15.w, end: 10.w, top: 20.h,bottom:30.h),
                    itemBuilder: (context, index) =>
                        FaqItemWidget(
                          faqModel: faqCubit.faqDataList[index],
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 15.h,),
                    itemCount: faqCubit.faqDataList.length),
              ),

            ],
          ),
        );
      },
    );
  }
}
