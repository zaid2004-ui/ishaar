import 'package:dio/dio.dart';
import 'package:ishaar/core/constant/api_constant.dart';
import 'package:ishaar/dependencies/interceptor/auth_interceptor.dart';

class DioDependency {
  static Dio? _dio;

  static Dio get dio {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: ApiConst.baceUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      _dio!.interceptors.add(AuthInterceptor(_dio!));
    }

    return _dio!;
  }
}
