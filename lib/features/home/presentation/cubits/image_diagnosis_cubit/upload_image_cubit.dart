
import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/home/presentation/cubits/image_diagnosis_cubit/upload_image_state.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());

  XFile? mouthImage;

  uploadMouthImage({required XFile tissueImg})
  {
      mouthImage=tissueImg;
      emit(UploadImageSuccess());
  }
  deleteMouthImage(){
    if(mouthImage==null){
      emit(UploadImageFailure(errMessage: 'There is no Image to delete !'));
    }
    else{
      mouthImage=null;
      emit(UploadImageFailure(errMessage: 'The image is deleted'));
    }
  }
}
