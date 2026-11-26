import 'package:dio/dio.dart';
import 'package:ishaar/core/constant/endpoint.dart';
import 'package:ishaar/model/login/request_login.dart';
import 'package:ishaar/model/login/response_login.dart';
import 'package:ishaar/model/otp/request_otp.dart';
import 'package:ishaar/model/otp/response_otp.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST(Endpoint.login)
  Future<ResponseLogin> login({@Body() required RequestLogin requestLogin});

  @POST(Endpoint.validateOtp)
  Future<ResponseOtp> validateOtp({@Body() required RequestOtp requestOtp});
}
