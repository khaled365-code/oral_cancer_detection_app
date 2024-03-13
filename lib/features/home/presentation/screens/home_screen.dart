import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/features/community/presentation/screens/community_home.dart';
import 'package:graduation_project/features/home/presentation/screens/news_screen.dart';
import 'package:graduation_project/features/home/presentation/screens/upload_Image_View.dart';
import 'package:graduation_project/features/profile/presentation/components/my_drawer_body.dart';
import 'package:graduation_project/features/profile/presentation/components/my_drawer_header.dart';
import 'doctor_screen.dart';

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
        items:const[
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.stethoscope),
              label: 'Diagnosis'),
          BottomNavigationBarItem(icon: Icon(Icons.mark_unread_chat_alt),
            label: 'Community',),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper_sharp),
              label: 'News'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userDoctor),
              label: 'Doctors'),
        ],
      ),

    );
  }
}


