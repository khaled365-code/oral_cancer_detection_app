import 'package:dio/dio.dart';
import 'package:graduation_project/core/api/api_endPoints.dart';

import '../cache/cache_helper.dart';

class ApiInterceptors extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters[ApiKeys.token]=
     CacheHelper().getData(key: ApiKeys.token)!= null?
     '${CacheHelper().getData(key: ApiKeys.token)}' : null;
    super.onRequest(options, handler);
  }



}