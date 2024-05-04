import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/profile_models/faq_model.dart';

part 'faq_screen_state.dart';

class FaqScreenCubit extends Cubit<FaqScreenState> {
  FaqScreenCubit() : super(FaqScreenInitial());



  List<FaQModel> faqDataList=[
    FaQModel(questionText: 'faq1',
        answerText: 'faqans1'),
    FaQModel(questionText: 'faq2',
        answerText: 'faqans2'),
    FaQModel(questionText: 'faq3',
        answerText: 'faqans3'),
    FaQModel(questionText: 'faq4',
        answerText: 'faqans4'),
    FaQModel(questionText: 'faq5',
        answerText: 'faqans5'),
    FaQModel(questionText: 'faq6',
        answerText: 'faqans6'),
    FaQModel(questionText: 'faq7',
        answerText: 'faqans7'),
    FaQModel(questionText: 'faq8',
        answerText: 'faqans8'),
    FaQModel(questionText: 'faq9',
        answerText: 'faqans9'),
    FaQModel(questionText: 'faq10',
        answerText: 'faqans10'),
  ];
  bool containerISOpen=false;

  void changeContainerShape()
  {
    containerISOpen=!containerISOpen;
    emit(FaqScreenChangeContainerShapeState());
  }
}
