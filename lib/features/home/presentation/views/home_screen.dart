import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/get_profile_data_cubit/profile_cubit.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/custom_app_bar.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/community/presentation/screens/community_screen.dart';
import 'package:graduation_project/features/profile/presentation/screens/initial_profile_screen.dart';
import 'package:graduation_project/features/home/presentation/views/componants/bottomnav_bar_column.dart';
import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'package:graduation_project/features/profile/presentation/screens/initial_profile_screen.dart';
import '../../../../core/utilis/app_styles.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex:selectedIndex ,
        selectedItemColor:AppColors.primary,
        backgroundColor:AppColors.white,
        unselectedItemColor:AppColors.black,
        onTap: onItemTapped,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_information_outlined), label: 'Diagnosis'),
          BottomNavigationBarItem(icon: Icon(Icons.comment_outlined),
            label: 'Community',),
          BottomNavigationBarItem(icon: Icon(Icons.radio_outlined),
              label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined), label: 'Doctors'),
        ],
      )
      ,

    );
  }
  PreferredSize showAppBar(){
    if(selectedIndex==0 || selectedIndex==1){

      return PreferredSize(
          preferredSize: Size(double.infinity, 40.h),
          child: DefaultAppBar(
            hasTitle: false,
            hasActions: true,
            hasLeading: true,
            leading: Builder(builder: (context) {
              return GestureDetector(
                  onTap: () async
                  {
                   await BlocProvider.of<GetProfileDataCubit>(context).GetUserProfile();
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(ImageConstants.homelines));
            }),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: 20.w),
                child: IconButton(
                  onPressed: () {
                    navigate(context: context, route: Routes.profileScreen);
                  },
                  icon: Icon(
                    Icons.person,
                    size: 35,
                  ),
                ),
              )
            ],
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
                child: Image.asset(ImageConstants.homelines));
          }
        ),
        title: Image.asset(ImageConstants.appLogo),
        actions:
      [
        Padding(
        padding:EdgeInsetsDirectional.only(end: 20.w,),
        child: GestureDetector(
          onTap: (){
            navigate(context: context, route: Routes.searchPostsScreen);
          },
            child: Image.asset(ImageConstants.searchCommunityImage))
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
                  child: Image.asset(ImageConstants.homelines));
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
                  child: Image.asset(ImageConstants.homelines));
            }
        ),
        title: Text('Recommended Doctors'),backgroundColor: AppColors.primary,));
    }
  }
}


