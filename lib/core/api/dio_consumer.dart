
import 'package:dio/dio.dart';
import 'package:graduation_project/core/api/api_consumer.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';
import 'package:graduation_project/core/api/api_interceptors.dart';
import 'package:graduation_project/core/errors/handle_error.dart';

class DioConsumer extends ApiConsumer{
  final  bool isTextModel;
  final  bool isImageModel;
    final Dio dio;
  DioConsumer({required this.dio,required this.isTextModel,required this.isImageModel}){

     isTextModel?dio.options.baseUrl=EndPoints.textModelBaseUrl:isImageModel?dio.options.baseUrl=EndPoints.photoModelBaseUrl:dio.options.baseUrl=EndPoints.baseUrl;

    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        responseHeader: true,
        requestHeader: true,
        requestBody: true,
        error: true
    ));
  }

    @override
    Future post(String path, {dynamic data, Map<String, dynamic>? queryParams, bool isFormData = false}) async {
        try {
          final response= await dio.post(
              path ,
              data:isFormData?FormData.fromMap(data): data,
              queryParameters: queryParams
          );
          return response.data;
        }
        on DioException catch (e) {
          HandleDioException(e);
        }
    }

    @override
    Future get(String path, {Object? data, Map<String, dynamic>? queryParams})async {
    try {
      final response= await dio.get(
          path ,
          data: data,
          queryParameters: queryParams
      );
      return response.data;
    }
    on DioException catch (e) {
      HandleDioException(e);
    }
  }

  @override
  Future delete(String path, {Object? data, Map<String, dynamic>? queryParams}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future patch(String path, {Object? data, Map<String, dynamic>? queryParams}) {
    // TODO: implement patch
    throw UnimplementedError();
  }


}