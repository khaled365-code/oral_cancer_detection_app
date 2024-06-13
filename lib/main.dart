import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/oral_cancer_app.dart';
import 'core/cache/cache_helper.dart';
import 'core/commons/bloc_obsever.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper().init();
  bool seenOnBorading=CacheHelper().getData(key: 'seenOnboarding')??false;
  runApp(MyApp(seenOnBoard: seenOnBorading,),);
  Bloc.observer=MyBlocObserver();

}




