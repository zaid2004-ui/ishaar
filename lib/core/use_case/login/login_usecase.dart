import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ishaar/dependencies/api/api_dependency.dart';
import 'package:ishaar/model/erorr/response_api_error.dart';
import 'package:ishaar/model/login/request_login.dart';
import 'package:ishaar/model/login/response_login.dart';

class LoginUsecase {
  Future<Either<ResponseApiError, ResponseLogin>> login({
    required RequestLogin requestLogin,
  }) async {
    try {
      final response = await ApiDependency.apiService.login(
        requestLogin: requestLogin,
      );
      return Right(response);
    } on DioException catch (e) {
      final data = e.response?.data;

      // السيرفر رد بـ error على شكل JSON
      if (data is Map<String, dynamic>) {
        return Left(ResponseApiError.fromJson(data));
      }

      // ما في رد من السيرفر (نت مقطوع، timeout...) أو الرد مش JSON
      return Left(
        ResponseApiError(
          success: false,
          message: _messageFromType(e.type),
          errorCode: e.message,
        ),
      );
    } catch (e) {
      return Left(
        ResponseApiError(
          success: false,
          message: 'Something went wrong. Please try again.',
          errorCode: e.toString(),
        ),
      );
    }
  }

  String _messageFromType(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Check your network.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
