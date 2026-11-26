import 'package:dartz/dartz.dart';
import 'package:ishaar/core/use_case/validat_otp.dart/validate_otp_usecase.dart';
import 'package:ishaar/model/erorr/response_api_error.dart';
import 'package:ishaar/model/otp/request_otp.dart';
import 'package:ishaar/model/otp/response_otp.dart';

class OtpRepo {
  final validateOtpUseCase = ValidateOtpUsecase();
  Future<Either<ResponseApiError, ResponseOtp>> validateOtp({
    required RequestOtp requestOtp,
  }) async {
    return await validateOtpUseCase.validateOtp(requsetOtp: requestOtp);
  }
}
