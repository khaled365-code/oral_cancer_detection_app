import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/data/models/hospital_model.dart';
import 'package:graduation_project/features/home/presentation/widgets/hospital_card.dart';

class HospitalsList extends StatelessWidget{
  final List<Hospital> hospitals;
  HospitalsList({required this.hospitals});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: hospitals.length,
        itemBuilder: (context,index){
          Hospital hospital = hospitals[index];
          return HospitalCard(image: hospital.image,
              hosName:hospital.name,
              aboutHos: hospital.about,
              hosNumber: hospital.number,
              location:hospital.location
          );
        }
    );
  }

}