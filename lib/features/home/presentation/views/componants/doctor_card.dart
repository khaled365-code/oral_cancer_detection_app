import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/app_text_styles.dart';

class DoctorCard extends StatelessWidget{
  DoctorCard({super.key , required this.image, required this.doctorName,
    required this.docDegree , required this.aboutDoc ,
    required this.docNumber,required this.docAddress});

  String image;
  String doctorName;
  String docDegree;
  String aboutDoc;
  String docNumber;
  String docAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:320,
      width: 350,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12)  ,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(8, 8),
          ),
        ],
      ),
      child:Padding(
        padding: const EdgeInsets.only(right:8,bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height:100,
                  width:100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width:8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctorName,
                      style:AppTextStyles.font20.copyWith(
                          color: AppColors.white ,),
                    ),
                    Text(docDegree ,
                      style:AppTextStyles.font16.copyWith(
                        color: AppColors.white ,
                        fontFamily: 'lato'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height:8,),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' About: $aboutDoc',
                    style:AppTextStyles.font14.copyWith(
                      color: AppColors.white ,),
                  ),
                  const SizedBox(height:8,),
                  Text(' Contact info: $docNumber',
                    style:AppTextStyles.font14.copyWith(
                      color: AppColors.white ,),
                  ),
                  const SizedBox(height:8,),
                  Text(' Address: $docAddress',
                    style:AppTextStyles.font14.copyWith(
                      color: AppColors.white ,),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}