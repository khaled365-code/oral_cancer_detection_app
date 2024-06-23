import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../community/presentation/views/community_screen.dart';
import '../../../../diagnosis/presentation/views/diagnosis_intro.dart';
import '../../views/hospital_city_screen.dart';
import '../../views/initial_home_screen.dart';
import '../../views/news_search_screen.dart';

part 'home_controller_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  HomeControllerCubit() : super(HomeControllerInitial());


  int selectedIndex =0;

  final List<Widget> pages=
  [
    const InitialHomeScreen(),
    const DiagnosisIntro(),
    CommunityScreen(),
    const NewsSearchScreen(),
    HospitalCity(),
  ];

   onItemTapped(int index)
  {
    selectedIndex = index;
    emit(HomeControllerIndexIsChanged());

  }






}
