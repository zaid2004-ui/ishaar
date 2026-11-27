import 'package:dio/dio.dart';
import 'package:ishaar/core/constant/api_constant.dart';
import 'package:ishaar/core/constant/endpoint.dart';
import 'package:ishaar/core/local/local_storage.dart';
import 'package:ishaar/core/local/local_storage_user.dart';
import 'package:ishaar/core/routes/app_pages.dart';
import 'package:ishaar/core/routes/app_routes.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio mainDio;
  AuthInterceptor(this.mainDio);

  bool _isPublic(String path) =>
      path.contains(Endpoint.login) ||
      path.contains(Endpoint.validateOtp) ||
      path.contains(Endpoint.refreshToken);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_isPublic(options.path)) {
      final token = await LocalStorageUser.instance.getTokens();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final is401 = err.response?.statusCode == 401;
    if (!is401 || _isPublic(err.requestOptions.path)) {
      return handler.next(err);
    }

    final refreshToken = await LocalStorageUser.instance.getRefreshToken();
    if (refreshToken == null) {
      await _logout();
      return handler.next(err);
    }

    try {
      final refreshDio = Dio(BaseOptions(baseUrl: ApiConst.baceUrl));
      final res = await refreshDio.post(
        Endpoint.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      final newToken = res.data['token'] as String;
      final newRefresh = res.data['refreshToken'] as String;
      await LocalStorageUser.instance.saveTokens(
        token: newToken,
        refreshToken: newRefresh,
      );

      final opts = err.requestOptions;
      opts.headers['Authorization'] = 'Bearer $newToken';
      final retryResponse = await mainDio.fetch(opts);
      return handler.resolve(retryResponse);
    } catch (_) {
      await _logout();
      return handler.next(err);
    }
  }

  Future<void> _logout() async {
    await LocalStorageUser.instance.clear();
    await LocalStorage.instens.setIsLogin(value: false);
    AppRoutes.startNewRoute(AppPages.loginSereen);
  }
}
