import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishaar/core/utils/widgets/custom_appbar.dart';
import 'package:ishaar/features/lang/view_model/cubit.dart';
import 'package:ishaar/features/lang/view_model/state.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<LocalizatoinCubit, LoclizationState>(
        builder: (context, state) {
          final cubit = context.read<LocalizatoinCubit>();

          return Column(
            spacing: 10,
            children: [
              const SizedBox(height: 5),

              RadioGroup<Locale>(
                groupValue: cubit.locale ?? const Locale('en'),
                onChanged: (value) {
                  if (value != null) {
                    cubit.getLaonguage(local: value.languageCode);
                  }
                },
                child: Column(
                  children: [
                    RadioListTile<Locale>(
                      value: const Locale('en'),
                      title: Text('English', style: theme.textTheme.bodyMedium),
                    ),
                    RadioListTile<Locale>(
                      value: const Locale('ar'),
                      title: Text('العربية', style: theme.textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
