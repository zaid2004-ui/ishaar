import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/routes/app_pages.dart';
import 'package:ishaar/core/routes/app_routes.dart';
import 'package:ishaar/core/utils/widgets/custom_loading.dart';
import 'package:ishaar/core/utils/widgets/snack_bar_helper.dart';
import 'package:ishaar/features/login/view/widget/login_card.dart';
import 'package:ishaar/features/login/view_model/cubit.dart';
import 'package:ishaar/features/login/view_model/state.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<LoginCubit>();

          return BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadingState) {
                CustomLoading.show(context);
              } else if (state is LoginErrorState) {
                CustomLoading.hide(context);
                SnackBarHelper.showError(
                  context,
                  state.responseApiError.toString(),
                );
              } else if (state is LoginSuccessState) {
                CustomLoading.hide(context);
                AppRoutes.startNewRoute(AppPages.otpScreen);
              }
            },
            child: Form(
              key: cubit.formKey,
              child: Scaffold(
                backgroundColor: colorScheme.primary,
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    Positioned(
                      top: 500,
                      left: -150,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary.withAlpha(30),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: -150,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary.withAlpha(30),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Center(
                      child: LoginCard(
                        passwordController: cubit.passwordController,
                        userNameControler: cubit.usernameController,
                        onLogin: cubit.login,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
