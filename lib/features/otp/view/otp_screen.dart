import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/routes/app_pages.dart';
import 'package:ishaar/core/routes/app_routes.dart';
import 'package:ishaar/core/utils/widgets/custom_loading.dart';
import 'package:ishaar/core/utils/widgets/snack_bar_helper.dart';
import 'package:ishaar/features/otp/view/widget/otp_widget.dart';
import 'package:ishaar/features/otp/view_model/cubit.dart';
import 'package:ishaar/features/otp/view_model/state.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.otpKey});
  final String otpKey;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ValidateOtpCubit(),

      child: Builder(
        builder: (context) {
          final cubit = context.read<ValidateOtpCubit>();

          return BlocListener<ValidateOtpCubit, ValidateOtp>(
            listener: (context, state) {
              if (state is LodingValidateOtp) {
                CustomLoading.show(context);
              } else if (state is ErorreValidateOtp) {
                CustomLoading.hide(context);

                cubit.otpCodControler.clear();
                SnackBarHelper.showError(
                  context,
                  state.responseApiError.message ?? 'Something went wrong.',
                );
              } else if (state is SucsessValidateOtp) {
                CustomLoading.hide(context);
                AppRoutes.startNewRoute(AppPages.mainScreen);
              }
            },
            child: OtpWidget(otpKey: otpKey),
          );
        },
      ),
    );
  }
}
