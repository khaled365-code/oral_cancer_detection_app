import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

   bool isDarkMode=false;

  changeTheme(bool isDark){
    emit(ChangeThemeLoadingState());
    isDarkMode=isDark;
    emit(ChangeThemeSuccessState(message: isDarkMode?'Welcome to Dark Mode':'Welcome to Light Mode'));
  }
}

