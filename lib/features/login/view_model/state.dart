import 'package:ishaar/model/erorr/response_api_error.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final ResponseApiError responseApiError;
  LoginErrorState({required this.responseApiError});
}

class LoginSuccessState extends LoginState {
  final String otpKey;
  LoginSuccessState({required this.otpKey});
}
