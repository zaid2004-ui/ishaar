import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/features/login/repo/login_repo.dart';
import 'package:ishaar/features/login/view_model/state.dart';
import 'package:ishaar/model/erorr/response_api_error.dart';
import 'package:ishaar/model/login/request_login.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());
  final formKey = GlobalKey<FormState>();
  final loginRepo = LoginRepo();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> login() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    emit(LoginLoadingState());
    final result = await loginRepo.login(
      request: RequestLogin(
        username: usernameController.text.trim(),
        password: passwordController.text,
      ),
    );
    if (isClosed) return;

    result.fold(
      (responseApiError) {
        debugPrint(
          '************************Login Error: ${responseApiError.message}',
        );

        emit(LoginErrorState(responseApiError: responseApiError));
      },
      (responsLogin) {
        if (responsLogin.success != true || responsLogin.otpKey == null) {
          emit(
            LoginErrorState(
              responseApiError: ResponseApiError(
                success: false,
                message: responsLogin.message ?? 'Login failed.',
              ),
            ),
          );
          return;
        }
        emit(LoginSuccessState(otpKey: responsLogin.otpKey!));
      },
    );
  }
}
