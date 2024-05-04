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
import 'package:graduation_project/features/home/presentation/views/componants/bottomnav_bar_column.dart';
import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'package:graduation_project/features/profile/presentation/components/my_drawer_body.dart';
import 'package:graduation_project/features/profile/presentation/components/my_drawer_header.dart';
import 'doctor_screen.dart';
import 'news_screen.dart';
//////////////////
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();

}
class HomePageState extends State<HomePage> {
  int selectedIndex =0;


  final List<Widget> pages=
  [
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
        child: SingleChildScrollView(
          child: Column(
            children:
            [
              MyDrawerHeader(),
              MyDrawerBody()
            ],
          ),
        ),
      ),
      body:pages[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            onTap: onItemTapped,
            animationDuration: Duration(milliseconds: 500),
            backgroundColor: AppColors.white,
            color: AppColors.white,
          buttonBackgroundColor: AppColors.primary,
          items: [
            BottomNavColumn(paddingValue: 8,icon: FontAwesomeIcons.stethoscope, text: 'Diagnosis'),
            BottomNavColumn(paddingValue: 5,icon: Icons.mark_unread_chat_alt, text: 'Community'),
            BottomNavColumn(paddingValue: 5,icon: Icons.newspaper_sharp, text: 'News'),
            BottomNavColumn(paddingValue: 5,icon:FontAwesomeIcons.userDoctor, text: 'Doctors')
          ]
      ),
    );
  }
  PreferredSize showAppBar(){
    if(selectedIndex==0){
      return PreferredSize(
          preferredSize: Size(double.infinity, 40.h),
          child: DefaultAppBar(
            hasTitle: false,
            hasActions: true,
            hasLeading: true,
            leading: Builder(builder: (context) {
              return GestureDetector(
                  onTap: () {
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
    else if(selectedIndex==1){
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
    else if(selectedIndex==2){
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


