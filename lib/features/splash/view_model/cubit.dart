import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/local/local_storage.dart';
import 'package:ishaar/features/splash/view_model/state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitState());

  Future<void> goNextPage() async {
    await Future.delayed(const Duration(seconds: 4));
    if (isClosed) return;

    final storage = LocalStorage.instens;
    // ONBORDING
    if (!storage.isShowOnboard) {
      emit(SplashOnBoardPageState());
      return;
    }

    final isLoggedIn = storage.isLogin;

    if (isLoggedIn) {
      emit(SplashHomePageState());
    } else {
      await storage.setIsLogin(value: false);
      emit(SplashLoginPageState());
    }
  }
}
