import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ishaar/dependencies/api/api_dependency.dart';
import 'package:ishaar/model/erorr/response_api_error.dart';
import 'package:ishaar/model/otp/request_otp.dart';
import 'package:ishaar/model/otp/response_otp.dart';

class ValidateOtpUsecase {
  Future<Either<ResponseApiError, ResponseOtp>> validateOtp({
    required RequestOtp requsetOtp,
  }) async {
    try {
      final respons = await ApiDependency.apiService.validateOtp(
        requestOtp: requsetOtp,
      );
      return Right(respons);
    } on DioException catch (e) {
      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        return Left(ResponseApiError.fromJson(data));
      }
      return left(
        ResponseApiError(
          success: false,
          message: _messageFromType(e.type),
          errorCode: e.toString(),
        ),
      );
    } catch (e) {
      return left(
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
