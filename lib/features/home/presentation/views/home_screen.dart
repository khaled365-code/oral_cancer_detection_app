import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/localization/app_localization.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/colors.dart';
import 'package:graduation_project/core/utilis/custom_app_bar.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/community/presentation/screens/community_screen.dart';
import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'package:graduation_project/features/profile/presentation/components/my_drawer_body.dart';
import 'package:graduation_project/features/profile/presentation/components/my_drawer_header.dart';
import '../../../../core/routes/routes.dart';
import 'doctor_screen.dart';
import 'news_screen.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
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
      appBar: showAppBar()  ,
      backgroundColor:const Color(0xfffafafa),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [MyDrawerHeader(), MyDrawerBody()],
          ),
        ),
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
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.stethoscope),
              label: 'Diagnosis'),
          BottomNavigationBarItem(icon: Icon(Icons.mark_unread_chat_alt),
            label: 'Community',),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper_sharp),
              label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper_sharp), label: 'Doctors'),
        ],
      ),
    );
  }
  PreferredSize showAppBar(){
    if(selectedIndex==0){

      return  PreferredSize(preferredSize: Size(double.infinity, 50.h),
      child: DefaultAppBar(
        hasTitle: true,
        hasActions: true,
        title:  Text("editprofile".tr(context)),actions: [Padding(
        padding: EdgeInsetsDirectional.only(end: 20.w),
        child: IconButton(onPressed: () {
          navigate(context: context, route: Routes.profileScreen);
        }, icon:Icon(Icons.person,size: 35,),),
      )],backgroundColor: AppColors.primary,));
    }
    else if(selectedIndex==1){
      return   PreferredSize(preferredSize: Size(double.infinity, 50.h,),
      child: DefaultAppBar(
        hasActions: true,
        hasTitle: true,
        title: Image.asset(ImageConstants.appLogo),
        actions:
      [
        Padding(
        padding:EdgeInsetsDirectional.only(end: 20.w,),
        child: GestureDetector(
          onTap: (){
            navigate(context: context, route: Routes.notificationsScreen);
          },
            child: Image.asset(ImageConstants.notificationsCommunityImage))
      ),
      ],
        backgroundColor: AppColors.white,));
    }
    else if(selectedIndex==2){
      return PreferredSize(preferredSize: Size(double.infinity, 50.h),
      child: DefaultAppBar(
        hasTitle: true,
        title: Text('Medical News'),backgroundColor:AppColors.primary ,));
    }
    else{
      return  PreferredSize(preferredSize: Size(double.infinity, 50.h),
      child: DefaultAppBar(
        hasTitle: true,
        title: Text('Recommended Doctors'),backgroundColor: AppColors.primary,));
    }
  }
}
// return PreferredSize(
//     preferredSize: const Size(double.infinity, 50),
//     child: DrawerAppBar()
// );


