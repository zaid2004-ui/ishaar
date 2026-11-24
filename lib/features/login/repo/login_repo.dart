import 'package:dartz/dartz.dart';
import 'package:ishaar/core/api/api_services.dart';
import 'package:ishaar/model/login/request_login.dart';

class LoginRepo {
  final ApiService apiService;
  LoginRepo(this.apiService);
  Future<Either<String, dynamic>> login(RequestLogin request) async {
    try {
      final respons = await apiService.login(request);
      return Right(respons);
    } catch (e) {
      return left(e.toString());
    }
  }
}
