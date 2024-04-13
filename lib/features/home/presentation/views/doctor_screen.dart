import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/app_assets.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

import 'componants/doctor_card.dart';

class DoctorPage extends StatelessWidget{
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background,
      // appBar: AppBar(
      //   elevation: 0 ,
      //   backgroundColor:AppColors.background,
      //   centerTitle: true,
      //   title:const  Text('Recommended Doctors',
      //     style:TextStyle(
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //       fontStyle: FontStyle.italic,
      //       color: AppColors.primary,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding:const EdgeInsets.only(top:16,right: 16,left: 16 ),
        child:SingleChildScrollView(
          child: Column(
            children: [
              DoctorCard(image:AppAssets.doc1,
                  doctorName:'Dr.ALADDIN',
                  docDegree:'Oncologist',
                  aboutDoc:'Professor of oncological surgery and oral surgery at '
                      'the National Cancer Institute Cairo University/Member of the European Society of Surgical Oncology.',
                  docNumber:'0406741535',
                  docAddress:'Cairo city'),
              SizedBox(height: 16.h,),

              DoctorCard(image:AppAssets.doc2,
                  doctorName:'Dr.ADEL ISMAIL',
                  docDegree:'Oncologist',
                  aboutDoc:'Consultant of Oncology and Radiotherapy. Doctorate in Oncology '
                      '- Oncology Institute -Cairo University,he has over 13 years of experience ',
                  docNumber:'0404715432',
                  docAddress:'Tanta city'),
              SizedBox(height: 16.h,),
              DoctorCard(image:AppAssets.doc3,
                  doctorName:'Dr.REDA NOUR AL-DIN',
                  docDegree:'Dentist',
                  aboutDoc:'highly specialized in the field of oral surgery and cosmetic dentistry.'
                      'Bachelor of Dentistry and Oral Medicine,Misr International University, Egypt'
                      ' he has over 11 years of experience in the field of Dentistry.',
                  docNumber:'040571765',
                  docAddress:'Benha city'),
              SizedBox(height: 16.h,),
              DoctorCard(image:AppAssets.doc4,
                  doctorName:'Dr.AHMED RASHAD',
                  docDegree:'Oncologist',
                  aboutDoc:'Consultant & doctorate degree in Medical Oncology,'
                      'specializes in the treatment of oral,neck & head tumors ',
                  docNumber:'0404814375',
                  docAddress:'6 October City'),
              SizedBox(height: 16.h,),
            ],

          ),
        ) ,

      ),
    );

  }
}