

import 'package:di_state_managment/utils/shared_preferences_manager.dart';
import 'package:di_state_managment/utils/shared_prefrences_const.dart';
import 'package:dio/dio.dart';

class AutenticationInterceptor extends Interceptor{

@override
  void onRequest(
    RequestOptions options, RequestInterceptorHandler handler) async{
  
    String? token = SharedPreferencesManager().getString(SharedPrefrencesConst.token);
    if (token!=null) {
      options.headers['Authorization'] = 'Bearer $token';

    } 
    super.onRequest(options, handler);
  }
}

class DioManager{


 static final Dio _dio = Dio();
 static Dio get dio{
  _dio.interceptors.add(AutenticationInterceptor());
  return _dio;
 }
}