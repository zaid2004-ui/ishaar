import 'package:ishaar/model/erorr/response_api_error.dart';

abstract class ValidateOtp {}

class InitValidateOtp extends ValidateOtp {}

class LodingValidateOtp extends ValidateOtp {}

class ErorreValidateOtp extends ValidateOtp {
  final ResponseApiError responseApiError;
  ErorreValidateOtp({required this.responseApiError});
}

class SucsessValidateOtp extends ValidateOtp {
  final String token;

  new({required this.token});
}
