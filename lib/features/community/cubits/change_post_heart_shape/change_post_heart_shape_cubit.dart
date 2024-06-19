import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_post_heart_shape_state.dart';

class ChangePostHeartShapeCubit extends Cubit<ChangePostHeartShapeState> {
  ChangePostHeartShapeCubit() : super(ChangePostHeartShapeInitial());




  bool heartIsActive=false;

  changeHeartShape()
  {

    heartIsActive=!heartIsActive;
    emit(ChangePostHeartShape());

  }


}
