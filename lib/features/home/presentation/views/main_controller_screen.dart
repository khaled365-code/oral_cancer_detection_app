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
import 'package:graduation_project/core/utilis/fontweight_helper.dart';
import 'package:graduation_project/core/widgets/custom_outlined_textfield.dart';
import 'package:graduation_project/core/widgets/default_app_bar.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/core/widgets/resuable_text.dart';
import 'package:graduation_project/features/community/presentation/views/community_screen.dart';
import 'package:graduation_project/features/diagnosis/presentation/views/diagnosis_intro.dart';
import 'package:graduation_project/features/home/presentation/cubits/home_contrller_cubit/home_controller_cubit.dart';
import 'package:graduation_project/features/home/presentation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:graduation_project/features/home/presentation/views/initial_home_screen.dart';
import 'package:graduation_project/features/home/presentation/widgets/bottomnav_bar_column.dart';
import 'package:graduation_project/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:graduation_project/features/profile/presentation/screens/initial_profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainControllerPage extends StatelessWidget{
   MainControllerPage({super.key});

   
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeControllerCubit, HomeControllerState>(
  builder: (context, state) {
    final homeControllerCubit =BlocProvider.of<HomeControllerCubit>(context);
    return Scaffold(
      appBar: showAppBar(homeControllerCubit) ,
      backgroundColor: AppColors.white,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: BlocProvider(
          create: (context) => GetProfileDataCubit(
              profileRepoImplementation: ProfileRepoImplementation(
                  api: DioConsumer(dio: Dio(), isTextModel: false, isImageModel: false))),
          child: ProfileOutScreen(),
        ),
      ),
      body: homeControllerCubit.pages[homeControllerCubit.selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: homeControllerCubit.selectedIndex,
          onTap: homeControllerCubit.onItemTapped,
          backgroundColor: AppColors.white,
          margin: EdgeInsets.only(right: 5.w),

          items: 
          [
          SalomonBottomBarItem(
          icon:Icon(Icons.home_outlined,),
          title: Text("Home",style: AppTextStyles.font10,),

          selectedColor: AppColors.primary,
        ),

        SalomonBottomBarItem(
          icon: Icon(FontAwesomeIcons.stethoscope),
          title: Text(' Diagnosis',style: AppTextStyles.font12,),
          selectedColor: AppColors.primary,
       ),
       SalomonBottomBarItem(
           icon: Icon(Icons.mark_unread_chat_alt),
           title: Text(' Community',style: AppTextStyles.font10,),
           selectedColor:AppColors.primary,
            ),
       SalomonBottomBarItem(
          icon: Icon(Icons.newspaper_sharp),
          title: Text(' News',style: AppTextStyles.font10,),
          selectedColor:AppColors.primary,
            ),
        SalomonBottomBarItem(
           icon: Icon(FontAwesomeIcons.hospital),
           title: Text(' Hospitals',style: AppTextStyles.font10,),
           selectedColor:AppColors.primary,
            ),
          ]
      ));
  },
);
  }
  PreferredSize showAppBar(HomeControllerCubit homeControllerCubit)
  {
    if(homeControllerCubit.selectedIndex==0 || homeControllerCubit.selectedIndex==1){
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
    else if(homeControllerCubit.selectedIndex==2){
      return   PreferredSize(preferredSize: Size(double.infinity, 40.h,),
      child: DefaultAppBar(
        hasActions: true,
        hasTitle: false,
        hasLeading: true,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
                onTap: ()
                {
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(ImageConstants.homelines,color: AppColors.white));
          }
        ),

        actions:
      [
        Padding(
        padding:EdgeInsetsDirectional.only(end: 20.w,),
        child: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: ()
              {
                navigate(context: context, route: Routes.searchPostsScreen);
              },
                child: Image.asset(ImageConstants.searchCommunityImage,color: AppColors.white,));
          }
        )
      ),
      ],
        backgroundColor: AppColors.primary,));
    }
    else if(homeControllerCubit.selectedIndex==4){
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
            title: ResuableText(
              text: 'Hospitals',
              color: AppColors.white,
              fontWeight: FontWeightHelper.regular,
              fontSize: 18,

            ),backgroundColor: AppColors.primary,));
          }
    else
    {
      //index==3(news)
      return PreferredSize(preferredSize: Size(double.infinity, 0.h),
      child: SizedBox());
    }

  }
}

