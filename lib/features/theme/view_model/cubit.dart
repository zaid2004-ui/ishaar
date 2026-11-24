import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/local/local_storage.dart';
import 'package:ishaar/features/theme/view_model/state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.system);
  ThemeMode? themeMode;

  void initTheme() {
    String? theme = LocalStorage.instens.getThemeMode();
    if (theme == 'light') {
      themeMode = ThemeMode.light;
      emit(ThemeState.light);
    } else if (theme == 'dark') {
      themeMode = ThemeMode.dark;
      emit(ThemeState.dark);
    } else {
      themeMode = ThemeMode.system;
      emit(ThemeState.system);
    }
  }

  Future<void> getTheme({required ThemeMode themeMode}) async {
    this.themeMode = themeMode;
    if (themeMode == ThemeMode.dark) {
      emit(ThemeState.dark);
    } else if (themeMode == ThemeMode.light) {
      emit(ThemeState.light);
    } else {
      emit(ThemeState.system);
    }
    await LocalStorage.instens.setTheme(themeMode: themeMode.name);
  }
}
