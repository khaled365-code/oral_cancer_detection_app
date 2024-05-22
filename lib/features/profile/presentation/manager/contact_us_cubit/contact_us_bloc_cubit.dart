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
    ContactUSModel(image: ImageConstants.websiteIcon, text: 'Website',subText: 'https://www.linkedin.com/in/khaled-mohamed--658333229'),
    ContactUSModel(image: ImageConstants.facebookIcon, text: 'Facebook',subText: 'https://www.facebook.com/khaled.M.Elsaeed/'),
    ContactUSModel(image: ImageConstants.twitterIcon, text: 'Twitter',subText: 'Khaledmo0000'),
    ContactUSModel(image: ImageConstants.instagramIcon, text: 'instagram',subText: 'https://www.instagram.com/khaaled_mohamed00/'),

  ];
  changeContainerShape()
  {
    containerISOpen=!containerISOpen;
    emit(ContactUsContainerShapeChangedState());


  }


}
