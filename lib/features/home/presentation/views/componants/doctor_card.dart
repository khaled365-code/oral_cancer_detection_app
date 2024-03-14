import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';

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
                      style:const TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(docDegree ,
                      style:const TextStyle(
                        fontSize:16,
                        color: Colors.white,
                      ),
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
                    style:const TextStyle(
                      fontSize:14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height:8,),
                  Text(' Contact info: $docNumber',
                    style:const TextStyle(
                      fontSize:14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height:8,),
                  Text(' Address: $docAddress',
                    style:const TextStyle(
                      fontSize:14,
                      color: Colors.white,
                    ),
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