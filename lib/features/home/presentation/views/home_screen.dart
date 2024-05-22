import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/custom_app_bar.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/community/presentation/screens/community_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/initial_profile_screen.dart';
import 'package:graduation_project/features/home/presentation/views/componants/bottomnav_bar_column.dart';
import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'doctor_screen.dart';
import 'news_screen.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();

}
class HomePageState extends State<HomePage> {
  int selectedIndex =0;
  final List<String>navBarIcons=[
    ImageConstants.diagnosisImage,
    ImageConstants.diagnosisImage,
    ImageConstants.diagnosisImage,
    ImageConstants.diagnosisImage,
    ImageConstants.diagnosisImage
  ];
  final List<Widget> pages=
  [
    const UploadImageView(),
    const UploadImageView(),
    CommunityScreen(),
    const MedicalNews(),
    const DoctorPage(),
  ];
  void onItemTapped(int index) {
    setState(()
    {
      selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar() ,
      backgroundColor:const Color(0xfffafafa),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: ProfileOutScreen(),
      ),
      body:pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: CurvedNavigationBar(
            height: 30.h,
            onTap: onItemTapped,
            animationDuration: Duration(milliseconds: 500),
            backgroundColor: AppColors.white,
            color: AppColors.white,
            buttonBackgroundColor: AppColors.primary,
            items: [
              BottomNavColumn(paddingValue: 8,icon: Icons.home_outlined, text: 'Home'),
              BottomNavColumn(paddingValue: 2,icon: FontAwesomeIcons.stethoscope, text: 'Diagnosis'),
              BottomNavColumn(paddingValue: 3,icon: Icons.mark_unread_chat_alt, text: 'Community'),
              BottomNavColumn(paddingValue: 5,icon: Icons.newspaper_sharp, text: 'News'),
              BottomNavColumn(paddingValue: 5,icon:FontAwesomeIcons.userDoctor, text: 'Doctors')
            ]
        ),
      ),
    );
  }
  PreferredSize showAppBar(){
    if(selectedIndex==0 || selectedIndex==1){
      return PreferredSize(
          preferredSize: Size(double.infinity, 40.h),
          child: DefaultAppBar(
            hasTitle: false,
            hasActions:false,
            hasLeading: true,
            leading: Builder(builder: (context) {
              return GestureDetector(
                  onTap: ()
                  {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(ImageConstants.homelines,color: AppColors.background));
            }),
            backgroundColor: AppColors.primary,
          ));
    }
    else if(selectedIndex==2){
      return   PreferredSize(preferredSize: Size(double.infinity, 40.h,),
      child: DefaultAppBar(
        hasActions: true,
        hasTitle: true,
        hasLeading: true,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
                onTap: ()
                {
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(ImageConstants.homelines,color: AppColors.primary));
          }
        ),
        title: Image.asset(ImageConstants.appLogo,color: AppColors.primary,),
        actions:
      [
        Padding(
        padding:EdgeInsetsDirectional.only(end: 20.w,),
        child: GestureDetector(
          onTap: ()
          {
            navigate(context: context, route: Routes.searchPostsScreen);
          },
            child: Image.asset(ImageConstants.searchCommunityImage,color: AppColors.primary,))
      ),
      ],
        backgroundColor: AppColors.white,));
    }
    else if(selectedIndex==3){
      return PreferredSize(preferredSize: Size(double.infinity, 40.h),
      child: DefaultAppBar(
        hasLeading: true,
        hasTitle: true,
        leading: Builder(
            builder: (context) {
              return GestureDetector(
                  onTap: ()
                  {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(ImageConstants.homelines,color: AppColors.background));
            }
        ),
        title: Text('Medical News'),backgroundColor:AppColors.primary ,));
    }
    else{
      return  PreferredSize(preferredSize: Size(double.infinity, 40.h),
      child: DefaultAppBar(
        hasTitle: true,
        hasLeading: true,
        leading: Builder(
            builder: (context) {
              return GestureDetector(
                  onTap: ()
                  {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(ImageConstants.homelines,color:AppColors.background,));
            }
        ),
        title: Text('Recommended Doctors'),backgroundColor: AppColors.primary,));
    }
  }
}


