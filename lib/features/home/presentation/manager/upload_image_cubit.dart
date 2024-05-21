import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());

  XFile? mouthImage;

  uploadMouthImage({required XFile tissueImg}){
      mouthImage=tissueImg;
      emit(UploadImageSuccess());

  }
}
