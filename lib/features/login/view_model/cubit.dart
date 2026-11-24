import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/use_case/login/login_usecase.dart';
import 'package:ishaar/features/login/view_model/state.dart';
import 'package:ishaar/model/login/request_login.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUsecase loginUseCase;

  Future<void> login(RequestLogin request) async {
    emit(LoginLoading());

    final result = await loginUseCase(request);

    result.fold(
      (error) => emit(LoginError(error)),
      (response) => emit(LoginSuccess(response)),
    );
  }
}
