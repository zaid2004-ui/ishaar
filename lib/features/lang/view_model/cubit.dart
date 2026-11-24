import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/local/local_storage.dart';
import 'package:ishaar/features/lang/view_model/state.dart';

class LocalizatoinCubit extends Cubit<LoclizationState> {
  LocalizatoinCubit() : super(LoclizationState.en);
  Locale? locale;

  void initLanguage({required BuildContext context}) {
    String? language = LocalStorage.instens.getLocal();

    if (language == 'en') {
      locale = Locale('en');
      emit(LoclizationState.en);
    } else {
      locale = Locale('ar');

      emit(LoclizationState.ar);
    }
  }

  Future<void> getLaonguage({required String local}) async {
    if (local == 'en') {
      locale = Locale('en');
      emit(LoclizationState.en);
    } else {
      locale = Locale('ar');

      emit(LoclizationState.ar);
    }
    await LocalStorage.instens.setLocal(local: local);
  }
}
