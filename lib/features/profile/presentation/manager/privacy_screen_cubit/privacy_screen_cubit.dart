import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/profile/data/models/privacy_screen_model.dart';
import 'package:meta/meta.dart';

part 'privacy_screen_state.dart';

class PrivacyScreenCubit extends Cubit<PrivacyScreenState> {
  PrivacyScreenCubit() : super(PrivacyScreenInitial());

  List<PrivacyScreenModel>privacyDataList=[
    PrivacyScreenModel(questionText: 'privacy1',
        answerText: 'privacyans1'),
    PrivacyScreenModel(questionText: 'privacy2',
        answerText: 'privacyans2'),
    PrivacyScreenModel(questionText: 'privacy3',
        answerText: 'privacyans3'),
    PrivacyScreenModel(questionText: 'privacy4',
        answerText: 'privacyans4'),
    PrivacyScreenModel(questionText: 'privacy5',
        answerText: 'privacyans5'),
    PrivacyScreenModel(questionText: 'privacy6',
        answerText: 'privacyans6'),
    PrivacyScreenModel(questionText: 'privacy7',
        answerText: 'privacyans7'),
    PrivacyScreenModel(questionText: 'privacy8',
        answerText: 'privacyans8'),
    PrivacyScreenModel(questionText: 'privacy9',
        answerText: 'privacyans9'),

  ];

  bool containerISOpen=false;

  void changeContainerShape()
  {
    containerISOpen=!containerISOpen;
    emit(PrivacyScreenChangeContainerShapeState());
  }
}
