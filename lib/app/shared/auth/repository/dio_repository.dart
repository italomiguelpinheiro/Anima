import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DioRepository {
 // Dio _dio = Dio(BaseOptions(baseUrl: URL_BASE));
 // Dio get dio => _dio;

  //Dio addToken(String token) {
  //  return dio
   //   ..interceptors.add(InterceptorsWrapper(
   //       onRequest: (RequestOptions options) {
   //          options.headers.addAll({"Authorization": "Bearer $token"});
   //          return options;
    //         }
    //         ));
          
              //_requestInterceptor(options, token)));
  }

  dynamic _requestInterceptor(RequestOptions options, String token) async {
    options.headers.addAll({"Authorization": "Bearer $token"});

    return options;
  }

