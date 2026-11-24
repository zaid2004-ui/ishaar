import 'package:dio/dio.dart';
import 'package:ishaar/core/constant/api_constant.dart';

class DioDependency {
  static Dio? _dio;

  static Dio get dio {
    _dio ??= Dio(
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

    return _dio!;
  }
}
