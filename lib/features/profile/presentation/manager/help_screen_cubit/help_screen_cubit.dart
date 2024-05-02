import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/profile/data/profile_models/help_model.dart';
import 'package:meta/meta.dart';

part 'help_screen_state.dart';

class HelpScreenCubit extends Cubit<HelpScreenState> {
  HelpScreenCubit() : super(HelpScreenInitialState());



  List<HelpModel>helpDataList=[
    HelpModel(text: 'text', ),
    HelpModel(text: 'text', ),
    HelpModel(text: 'text', ),
    HelpModel(text: 'text', ),
    HelpModel(text: 'text', ),
    HelpModel(text: 'text',),

  ];
  bool containerISOpen=false;

  void changeContainerShape()
  {
    containerISOpen=!containerISOpen;
    emit(HelpScreenChangeContainerShapeState());
  }

}
