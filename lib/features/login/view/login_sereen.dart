import 'package:flutter/material.dart';
import 'package:ishaar/core/utils/widgets/snack_bar_helper.dart';
import 'package:ishaar/features/login/view/widget/login_card.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controllers للتحكم بالحقول
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // مفتاح الفورم
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // تنظيف الـ Controllers عند إغلاق الشاشة
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: formKey,
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
                passwordController: passwordController,
                emailControler: emailController,
                onLogin: () {
                  // تسجيل دخول وهمي لمعاينة الشاشة
                  if (formKey.currentState!.validate()) {
                    SnackBarHelper.showSuccess(context, 'Demo Login - UI Only');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
