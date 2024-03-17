import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/utilis/custom_app_bar.dart';
import 'package:graduation_project/core/widgets/custom_app_bar.dart';
import 'package:graduation_project/features/community/presentation/screens/community_home.dart';

import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'package:graduation_project/features/profile/presentation/components/my_drawer_body.dart';
import 'package:graduation_project/features/profile/presentation/components/my_drawer_header.dart';
import '../../../../core/widgets/drawer_app_bar.dart';
import 'doctor_screen.dart';
import 'news_screen.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  int selectedIndex =0;
  final List<Widget> pages=[
    const UploadImageView(),
    CommunityScreen(),
    const MedicalNews(),
    const DoctorPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: DrawerAppBar()
      ),
      backgroundColor:const Color(0xfffafafa),
      drawer: Drawer(
        child: Column(
          children: [MyDrawerHeader(), MyDrawerBody()],
        ),
      ),
      body:pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex:selectedIndex ,
        selectedItemColor:Colors.grey,
        backgroundColor:AppColors.primary,
        unselectedItemColor: Colors.white,
        onTap: onItemTapped,
        items:const [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.stethoscope),
              label: 'Diagnosis'),
          BottomNavigationBarItem(icon: Icon(Icons.mark_unread_chat_alt),
            label: 'Community',),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper_sharp),
              label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper_sharp),
              label: 'Doctors'),
        ],
      ),

    );
  }
  PreferredSize showAppBar(){
    if(selectedIndex==0){
      return PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: DrawerAppBar()
      );
    }
    else if(selectedIndex==1){
      return  PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: AppBar(title:Text('Welcome') ,centerTitle: true,elevation: 0,
            backgroundColor: AppColors.transparent
            ));
      
    }
    else if(selectedIndex==2){
      return PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: AppBar(title:Text('Medical News') ,centerTitle: true,elevation: 0,
              backgroundColor: AppColors.primary
          ));

    }
    else{
      return PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: AppBar(title:Text('Recommended Doctors') ,centerTitle: true,elevation: 0,
              backgroundColor: AppColors.primary
          ));

    }

  }
}


