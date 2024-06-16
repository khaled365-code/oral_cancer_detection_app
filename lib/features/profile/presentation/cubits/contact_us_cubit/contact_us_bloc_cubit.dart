import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/profile/data/models/contact_us_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utilis/image_constants.dart';

part 'contact_us_bloc_state.dart';

class ContactUsBloc extends Cubit<ContactUsBlocState> {
  ContactUsBloc() : super(ContactUsBlocInitial());

  bool containerISOpen=false;


  final List<ContactUSModel>contactUsList=[
    ContactUSModel(image:  ImageConstants.whatsAppIcon , text: 'WhatsApp',subText: '(010) 133-28223'),
    ContactUSModel(image: ImageConstants.websiteIcon, text: 'Website',subText: 'Page: HealthMouth on Facebook'),
    ContactUSModel(image: ImageConstants.facebookIcon, text: 'Facebook',subText: 'Page: HealthMouth on Facebook'),
    ContactUSModel(image: ImageConstants.twitterIcon, text: 'Twitter',subText: 'userName: @HMouth3938'),
    ContactUSModel(image: ImageConstants.instagramIcon, text: 'instagram',subText: 'userName: health_mouth_app'),

  ];
  changeContainerShape()
  {
    containerISOpen=!containerISOpen;
    emit(ContactUsContainerShapeChangedState());


  }


}
