import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/profile/data/profile_models/help_model.dart';
import 'package:meta/meta.dart';

part 'help_screen_state.dart';

class HelpScreenCubit extends Cubit<HelpScreenState> {
  HelpScreenCubit() : super(HelpScreenInitialState());



  List<HelpModel>helpDataList=[
    HelpModel(questionText: ' How can I take photos of mouth for detection ?',answerText: 'Ensure good lighting and a clear view of your mouth. Follow the prompts in the app to position your mouth correctly within the frame.' ),
    HelpModel(questionText: 'What should I do if the app detects issue ?',
        answerText: "If the app detects a potential issue, it's important to follow up with a healthcare professional for further evaluation and diagnosis. The app is meant to assist in early detection, but a professional assessment is necessary for confirmation." ),
    HelpModel(questionText: 'How often should I use the oral cancer feature ?',
        answerText: "You can use the oral cancer detection feature as often as you like, but it's recommended to use it regularly as part of your oral health routine. Monthly checks may be sufficient for most users."),
    HelpModel(questionText: 'Can I use app to track changes in oral health ?',
        answerText: 'Yes, the app allows you to track changes in your oral health by storing previous photos and analysis results. You can compare current and past images to monitor any developments or changes.'),
    HelpModel(questionText: 'What should I do if I have technical issues ?',
        answerText: "If you encounter technical issues, you can reach out to our support team through the app for assistance. Provide details about the problem you're experiencing, and we'll work to resolve it as quickly as possible."),
    HelpModel(questionText: 'How secure is my data within the app ?',
        answerText: 'We take data security seriously and implement measures to protect your personal information. Your data is encrypted and stored securely, and we adhere to strict privacy guidelines to ensure confidentiality.'),
    HelpModel(questionText: 'What should I do if I forgot my password ?',
        answerText: "If you forget your password, you can easily reset it through the app. Follow the password reset instructions, and you'll receive an email or SMS with further steps to regain access to your account."),


  ];
  bool containerISOpen=false;

  void changeContainerShape()
  {
    containerISOpen=!containerISOpen;
    emit(HelpScreenChangeContainerShapeState());
  }

}
