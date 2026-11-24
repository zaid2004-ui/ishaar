import 'package:dartz/dartz.dart';
import 'package:ishaar/core/use_case/login/login_usecase.dart';
import 'package:ishaar/model/erorr/response_api_error.dart';
import 'package:ishaar/model/login/request_login.dart';
import 'package:ishaar/model/login/response_login.dart';

class LoginRepo {
  final _loginUseCase = LoginUsecase();
  Future<Either<ResponseApiError, ResponseLogin>> login({
    required RequestLogin request,
  }) async {
    return await _loginUseCase.login(requestLogin: request);
  }
}
