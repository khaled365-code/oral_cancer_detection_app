import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/new_all_posts_model/Data.dart';

part 'change_retweet_shape_state.dart';

class ChangeRetweetCubit extends Cubit<ChangeRetweetState> {
  ChangeRetweetCubit() : super(ChangeRetweetShapeInitial());


 bool currentIndexISActive=false;

  changeRetweetShape({bool? activeValue})
  {
    if(activeValue!=null)
     {
       currentIndexISActive=activeValue;
       emit(ChangeRetweetShape());

       return;
     }
    currentIndexISActive=!currentIndexISActive;
    emit(ChangeRetweetShape());

  }


}
