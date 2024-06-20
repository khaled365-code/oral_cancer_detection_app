import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/home/presentation/cubits/image_diagnosis_cubit/upload_image_cubit.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key, required this.conHeight,
    required this.conWidth,this.conImage,this.borderRadius,this.border
  });

  final double conHeight;
  final double conWidth;
  final String? conImage;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:conHeight,
      width:conWidth,
      decoration:BoxDecoration(
        color: Colors.grey.withOpacity(.5),
        borderRadius:borderRadius ,
        border:border ,
        image:  conImage!=null? DecorationImage(
          image: AssetImage(conImage??''),
          fit: BoxFit.fill,
        ): null,
      ),
    );
  }
}




class UImageContainer extends StatelessWidget {
  const UImageContainer({
    super.key, required this.conHeight, required this.conWidth,  required this.conImage,
  });

  final double conHeight;
  final double conWidth;
  final ImageProvider conImage;


  @override
  Widget build(BuildContext context) {
    return
        Container(
          height:conHeight,
          width:conWidth,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: conImage,
              fit: BoxFit.fill,
            ),
          ),
        );

  }
}