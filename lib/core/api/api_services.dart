import 'package:dio/dio.dart';
import 'package:ishaar/core/constant/endpoint.dart';
import 'package:ishaar/model/login/request_login.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @POST(Endpoint.login)
  Future<dynamic> login(@Body() RequestLogin request);
}
