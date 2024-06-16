import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/presentation/cubits/image_diagnosis_cubit/upload_image_cubit.dart';
import '../../../data/repo/ai_repo.dart';
part 'image_diagnosis_state.dart';

class ImageDiagnosisCubit extends Cubit<ImageDiagnosisState> {
  ImageDiagnosisCubit({required this.aiRepository}) : super(ImageDiagnosisInitial());
  final AiRepository aiRepository;


  imageDiagnosis(BuildContext context)async{
    emit(ImageDiagnosisLoadingState());
    final image = BlocProvider.of<UploadImageCubit>(context).mouthImage;
    if (image == null) {
      emit(ImageDiagnosisFailureState(errMessage: 'No image selected.'));
      return;
    }
    final response=await aiRepository.imageDiagnosis(image:image);
    print(response);
    response.fold((errModel) => emit(ImageDiagnosisFailureState(errMessage: errModel)), (imageModel) => emit(ImageDiagnosisSuccessState()));
  }

}