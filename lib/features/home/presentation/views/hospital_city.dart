import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/home/data/models/hospital_model.dart';
import 'package:graduation_project/features/home/presentation/widgets/city_button.dart';
import 'package:graduation_project/features/home/presentation/widgets/hospitals_list_view.dart';


class HospitalCity extends StatefulWidget{
  @override
  State<HospitalCity> createState() => _HospitalCityState();
}

class _HospitalCityState extends State<HospitalCity> {
  final cities = ['Cairo','Gharbia','Shibin El Kom','Dakahlia','Upper Egypt'];
  int selectedIndex = 0;

  final Map<String, List<Hospital>> cityHospitals = {
    'Cairo': [
      Hospital(
        name: 'The National Cancer Institute in Cairo',
        image: ImageConstants.cairoNationalHos,
        about:'It provides diagnostic and treatment services for various types of cancer, including chemotherapy, radiation therapy, and surgery.',
        number: '0223664690',
        location: 'Cairo',
      ),
      Hospital(
        name: 'Nasser Institute for Research and Medical Sciences',
        image: ImageConstants.cairoNaserHos,
        about: 'It is a prominent research and medical center in the field of cancer treatment and related research.',
        number: '0224328066',
        location: 'Dokki area of Cairo',
      ),
      Hospital(
        name: 'October Cancer Institute ',
        image: ImageConstants.cairo6OctoberHos,
        about: 'Provides comprehensive services for cancer diagnosis and treatment, with specialized units for radiation therapy, surgery, and chemotherapy',
        number: '01009000103',
        location:' 6th of October City',
      ),
    ],
     'Gharbia': [
      Hospital(
        name:'Tanta Cancer Institute',
        image: ImageConstants.tantaHos,
        about:'It serves as a primary reference for cancer treatment in Gharbia governorate.'
        'Provides specialized treatment and care services for patients with various types of cancer',
        number:'0403337505',
        location:'Tanta',
      ),
    ],
    'Shibin El Kom': [
      Hospital(
        name:'Shibin El Kom Cancer Institute',
        image: ImageConstants.sibienHos,
        about:'It serves as a primary reference for cancer treatment in Menoufia Governorate,Provides specialized treatment and care services for patients with various types of cancer.',
        number:'No contact Number',
        location:'Shibin El Kom,Menofia',
      ),
    ],
     'Dakahlia': [
      Hospital(
        name:'Mansoura Cancer Institute',
        image: ImageConstants.mansouraHos,
        about:'It serves as a primary reference for cancer treatment in Menoufia Governorate,Provides specialized treatment and care services for patients with various types of cancer.'
        'Offers comprehensive services for cancer diagnosis and treatment',
        number:'050 2358021',
        location:'Mansoura ',
      ),
    ],
    'Upper Egypt': [
      Hospital(
        name:'Shefaa El Orman Oncology Hospital',
        image: ImageConstants.luxorHos,
        about:'It serves as a primary reference for cancer treatment in Menoufia Governorate,Provides specialized treatment and care services for patients with various types of cancer.'
            'Offers comprehensive services for cancer diagnosis and treatment',
        number:'41228091811',
        location:'New Tiba,Luxor',
      ),
      Hospital(
        name:'Assiut Cancer Institute:',
        image: ImageConstants.assiotHos,
        about:'Offers comprehensive services for cancer diagnosis and treatment in the city of Assiut'
        'Includes specialized units for radiation therapy, chemotherapy, and cancer surgery.',
        number:' 0882086026',
        location:'Assiut',
      ),
    ],
      };
  @override

  Widget build(BuildContext context) {
    List<Hospital> hospitals = cityHospitals[cities[selectedIndex]] ?? [];
     
    return CustomScrollView(
      slivers: [
      SliverToBoxAdapter(child: SizedBox(height: 12,),),
      SliverToBoxAdapter(
        child: SizedBox(
        height: 80.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:cities.length,
            itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal:8,vertical: 12),
                child: CityNameButton(
                  isSelected: index==selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex=index;
                    });
                  },
                  cityName: cities[index],

                ),
              );
            }
        ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 16,),),
      SliverToBoxAdapter(child: HospitalsList(hospitals:hospitals),)
      ],
    );
      
  }
}