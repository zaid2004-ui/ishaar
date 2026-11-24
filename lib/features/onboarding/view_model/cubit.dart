import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/local/local_storage.dart';
import 'package:ishaar/features/onboarding/view_model/state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(count: 0));

  Future<void> setShowOnboarding() async {
    await LocalStorage.instens.setShowOnboard(value: true);
  }

  void changePage(int index) {
    emit(OnboardingState(count: index));
  }
}
