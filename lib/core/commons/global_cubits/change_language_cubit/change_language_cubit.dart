import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());

  String pressedLanguage='';
  String languageCode='en';
  bool isArabic=false;

  updateLanguage(){
    emit(ChangeLanguageLoading());

    if(languageCode==pressedLanguage){
      return ;
    }
    languageCode=isArabic?'en':'ar';
    isArabic=!isArabic;
    emit(ChangeLanguageSuccessState(userMessage: languageCode=='en'?"the language chosen is english":"لقد قمت باختيار اللغه العربيه"));
  }


}
