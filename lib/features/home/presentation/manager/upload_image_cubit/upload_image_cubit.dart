
import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/home/presentation/manager/upload_image_cubit/upload_image_state.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());

  XFile? mouthImage;

  uploadMouthImage({required XFile tissueImg})
  {
      mouthImage=tissueImg;
      emit(UploadImageSuccess());
  }


}
