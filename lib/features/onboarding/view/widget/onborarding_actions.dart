import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/routes/app_pages.dart';
import 'package:ishaar/core/routes/app_routes.dart';
import 'package:ishaar/core/utils/widgets/custom_onboarding_button.dart';
import 'package:ishaar/features/onboarding/view_model/cubit.dart';
import 'package:ishaar/l10n/app_localizations.dart';

class OnborardingActions extends StatelessWidget {
  const OnborardingActions({super.key, this.index, this.controller});
  final int? index;
  final CarouselSliderController? controller;

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomOnboardingButton(
          onPressed: () {
            context.read<OnboardingCubit>().setShowOnboarding();
            AppRoutes.pushNamed(AppPages.loginSereen);
          },
          text: AppLocalizations.of(context)!.skip,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: CustomOnboardingButton(
          onPressed: () {
            controller!.nextPage(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOutCubic,
            );
          },
          text: AppLocalizations.of(context)!.next,
        ),
      );
    }
  }
}
