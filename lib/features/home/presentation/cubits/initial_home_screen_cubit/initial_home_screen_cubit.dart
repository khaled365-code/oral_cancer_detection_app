import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/home/data/models/carousel_data_model/carousel_data_model.dart';
import 'package:graduation_project/features/home/data/models/for_your_knowledge_model/for_your_knowledge_model.dart';
import 'package:meta/meta.dart';

part 'initial_home_screen_state.dart';

class InitialHomeScreenCubit extends Cubit<InitialHomeScreenState> {
  InitialHomeScreenCubit() : super(InitialHomeScreenInitial());


  List<CarouselDataModel>carouselDataList=
  [
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage,
        advertisementText: 'Upload a photo\nto detect oral cancer\nor leukoplakia\nwith our AI\ntechnology',
        btnText: 'Start Now'),
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage, advertisementText: 'Share your journey,\nask questions and\nget support from\npeople with similar\nconditions in our\ncommunity', btnText: 'Join Now'),
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage, advertisementText: 'Discover hospitals\nacross Egypt\nspecializing in oral\ncancer Easily\naccess and contact\ntheir information', btnText: 'Find Hospitals'),
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage, advertisementText: 'Stay updated with\ntop medical news\nSearch for the latest\ninformation\non treatments', btnText: 'Read News'),
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage, advertisementText: 'Receive clear\nguidelines after\nyour detection\nresult and learn\nmore about the\npossible condition', btnText: 'Learn More')
  ];


  CarouselController buttonCarouselController = CarouselController();



  List<ForYourKnowledgeModel>forYourKnowledgeList=[
    ForYourKnowledgeModel(title: 'Oral Cancer', description: 'Early Signs and Symptoms of Oral Cancer'),
    ForYourKnowledgeModel(title: 'Leukoplakia vs. Oral Cancer', description: 'Understanding the differences and connections between leukoplakia and oral cancer'),
    ForYourKnowledgeModel(title: 'Risk Factors for Oral Cancer', description: 'Common risk factors including smoking, alcohol use, and HPV infection'),
    ForYourKnowledgeModel(title: 'Maintaining Good Oral Hygiene', description: 'Tips and best practices for maintaining oral health to prevent diseases'),
    ForYourKnowledgeModel(title: 'Role of Regular Dental Checkups', description: 'Importance of regular dental visits for early detection of oral health issues.'),
    ForYourKnowledgeModel(title: 'Maintaining Good Oral Hygiene', description: 'Tips and best practices for maintaining oral health to prevent diseases'),


  ];







}
