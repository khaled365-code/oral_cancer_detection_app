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
import 'package:graduation_project/core/utilis/app_text_styles.dart';
import 'package:graduation_project/core/widgets/custom_outlined_textfield.dart';
import 'package:graduation_project/core/widgets/default_app_bar.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/community/presentation/screens/community_screen.dart';
import 'package:graduation_project/features/home/presentation/views/diagnosis_intro.dart';
import 'package:graduation_project/features/home/presentation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:graduation_project/features/home/presentation/views/initial_home_screen.dart';
import 'package:graduation_project/features/home/presentation/widgets/bottomnav_bar_column.dart';
import 'package:graduation_project/features/home/presentation/views/hospital_city.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:graduation_project/features/profile/presentation/screens/initial_profile_screen.dart';
import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'news_screen.dart';
import 'news_search_screen.dart';

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
    const DiagnosisIntro(),
    CommunityScreen(),
    const NewsSearchScreen(),
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
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: widget.selectedIndex,
          onTap: onItemTapped,
          backgroundColor: AppColors.white,
          items: [
          SalomonBottomBarItem(
          icon:Icon(Icons.home_outlined,),
          title: Text("Home"),
          selectedColor: AppColors.primary,
        ),

        SalomonBottomBarItem(
          icon: Icon(FontAwesomeIcons.stethoscope),
          title: Text('Diagnosis'),
          selectedColor: AppColors.primary,
       ),
       SalomonBottomBarItem(
           icon: Icon(Icons.mark_unread_chat_alt),
           title: Text('Community'),
           selectedColor:AppColors.primary,
            ),
       SalomonBottomBarItem(
          icon: Icon(Icons.newspaper_sharp),
          title: Text('News'),
          selectedColor:AppColors.primary,
            ),
        SalomonBottomBarItem(
           icon: Icon(FontAwesomeIcons.hospital),
           title: Text('Hospitals'),
           selectedColor:AppColors.primary,
            ),
          ]
      ));
  }
  PreferredSize showAppBar()
  {
    var searchCubit = BlocProvider.of<SearchNewsCubit>(context);
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
    else if(widget.selectedIndex==4){
      return PreferredSize(preferredSize: Size(double.infinity, 40.h),
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
    else{
      //index==3(news)
      return PreferredSize(preferredSize: Size(double.infinity, 0.h),
      child: SizedBox());
    }

  }
}

