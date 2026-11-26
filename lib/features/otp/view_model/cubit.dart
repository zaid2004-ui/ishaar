import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/local/local_storage.dart';
import 'package:ishaar/core/local/local_storage_user.dart';
import 'package:ishaar/features/otp/repo/otp_repo.dart';
import 'package:ishaar/features/otp/view_model/state.dart';
import 'package:ishaar/model/erorr/response_api_error.dart';
import 'package:ishaar/model/otp/request_otp.dart';

class ValidateOtpCubit extends Cubit<ValidateOtp> {
  ValidateOtpCubit() : super(InitValidateOtp());
  final otpRepo = OtpRepo();
  final otpCodControler = TextEditingController();
  @override
  Future<void> close() {
    otpCodControler.dispose();
    return super.close();
  }

  Future<void> validateOtp({required String key}) async {
    emit(LodingValidateOtp());
    final respons = await otpRepo.validateOtp(
      requestOtp: RequestOtp(key: key, code: otpCodControler.text.trim()),
    );
    if (isClosed) return;

    respons.fold(
      (responseApiError) {
        emit(ErorreValidateOtp(responseApiError: responseApiError));
      },
      (response) async {
        final token = response.token;
        final refreshToken = response.refreshToken;

        if (response.success != true || token == null || refreshToken == null) {
          emit(
            ErorreValidateOtp(
              responseApiError: ResponseApiError(
                success: false,
                message: response.message,
              ),
            ),
          );
          return;
        }

        await LocalStorageUser.instance.saveTokens(
          token: token,
          refreshToken: refreshToken,
        );
        await LocalStorage.instens.setIsLogin(value: true);

        if (isClosed) return;
        emit(SucsessValidateOtp(token: token));
      },
    );
  }
}
