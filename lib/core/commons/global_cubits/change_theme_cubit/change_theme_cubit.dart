import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/profile/data/models/dark_mode_data_model.dart';
import 'package:meta/meta.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

   bool isDarkMode=false;


  changeCircleActiveState(int currentIndex,List<DarkModeDataModel> darkModeDataList)
  {
    for (var item in darkModeDataList)
      {
        item.modeIsSelected=false;
      }
    darkModeDataList[currentIndex].modeIsSelected=!darkModeDataList[currentIndex].modeIsSelected;
    emit(ChangeThemeCurrentActiveState());

  }

  List<DarkModeDataModel>darkModeDataList=
  [
     DarkModeDataModel(modeName: 'On', modeIsSelected: false),
     DarkModeDataModel(modeName: 'Off', modeIsSelected: true),
   ];

  changeThemeToLight()
  {
    isDarkMode=false;
    emit(ChangeThemeSuccessState(successMessage: 'Theme Changed To Light Mode'));
  }
  changeThemeToDark()
  {
    isDarkMode=true;
    emit(ChangeThemeSuccessState(successMessage: 'Theme Changed To Dark Mode'));
  }
}

