import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/utils/images/app_images.dart';
import 'package:ishaar/features/otp/view_model/cubit.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key, required this.otpKey});
  final String otpKey;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ValidateOtpCubit>();
    final colorScheme = Theme.of(context).colorScheme;

    final pinTheme = PinTheme(
      width: 44,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: colorScheme.onSurface),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.tertiary.withAlpha(500)),
      ),
    );
    return Scaffold(
      backgroundColor: colorScheme.secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.iconImage, width: 140, height: 140),
              const SizedBox(height: 24),
              Text(
                'Please enter the code',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: cubit.otpCodControler,
                  length: 6,
                  defaultPinTheme: pinTheme,
                  focusedPinTheme: pinTheme.copyWith(
                    decoration: pinTheme.decoration!.copyWith(
                      border: Border.all(color: colorScheme.primary, width: 2),
                    ),
                  ),
                  onCompleted: (_) => cubit.validateOtp(key: otpKey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
