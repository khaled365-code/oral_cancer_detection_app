import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/api/dio_consumer.dart';
import 'package:graduation_project/core/commons/functions.dart';
import 'package:graduation_project/core/commons/global_cubits/get_profile_data_cubit/profile_cubit.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utilis/app_colors.dart';
import 'package:graduation_project/core/widgets/default_app_bar.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/community/presentation/screens/community_screen.dart';
import 'package:graduation_project/features/home/presentation/views/initial_home_screen.dart';
import 'package:graduation_project/features/home/presentation/widgets/bottomnav_bar_column.dart';
import 'package:graduation_project/features/home/presentation/views/hospital_city.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:graduation_project/features/profile/presentation/screens/initial_profile_screen.dart';
import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'news_screen.dart';

class HomePage extends StatefulWidget{
   HomePage({super.key});

  int selectedIndex =0;

  @override
  State<HomePage> createState() => HomePageState();

}
class HomePageState extends State<HomePage> {

  final List<Widget> pages=
  [
    const InitialHomeScreen(),
    const UploadImageView(),
    CommunityScreen(),
    const MedicalNews(),
    HospitalCity(),
  ];
  void onItemTapped(int index)
  {
    setState(()
    {
      widget.selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar() ,
      backgroundColor:const Color(0xfffafafa),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: BlocProvider(
          create: (context) => GetProfileDataCubit(
              profileRepoImplementation: ProfileRepoImplementation(
                  api: DioConsumer(dio: Dio(), isTextModel: false, isImageModel: false))),
          child: ProfileOutScreen(),
        ),
      ),
      body: pages[widget.selectedIndex],
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
              BottomNavColumn(paddingValue: 5,icon:FontAwesomeIcons.hospital, text: 'Hospitals')
            ]
        ),
      ),
    );
  }
  PreferredSize showAppBar()
  {
    if(widget.selectedIndex==0 || widget.selectedIndex==1){
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
    else if(widget.selectedIndex==2){
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
    else if(widget.selectedIndex==3){
      return PreferredSize(preferredSize: Size(double.infinity, 40.h),
      child: DefaultAppBar(
        actions: [
          IconButton(onPressed: (){
            navigate(context: context, route: Routes.searchNewsScreen);

        },
              icon: Icon(Icons.search,size: 28,))],
        hasActions: true,
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
        title: Text('Recommended Hospitals'),backgroundColor: AppColors.primary,));
    }
  }
}


