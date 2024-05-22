import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/presentation/manager/upload_image_cubit.dart';
import 'package:meta/meta.dart';
import '../../../data/repo/ai_repo.dart';
part 'image_diagnosis_state.dart';

class ImageDiagnosisCubit extends Cubit<ImageDiagnosisState> {
  ImageDiagnosisCubit({required this.aiRepository}) : super(ImageDiagnosisInitial());
 final AiRepository aiRepository;


  imageDiagnosis(BuildContext context)async{
    emit(ImageDiagnosisLoadingState());
    final response=await aiRepository.imageDiagnosis(image:BlocProvider.of<UploadImageCubit>(context).mouthImage!);
    print(response);
    response.fold((errModel) => emit(ImageDiagnosisFailureState(errMessage: errModel)), (imageModel) => emit(ImageDiagnosisSuccessState()));
  }

}
