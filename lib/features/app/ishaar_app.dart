import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ishaar/core/routes/app_pages.dart';
import 'package:ishaar/core/routes/app_routes.dart';
import 'package:ishaar/core/utils/theme/app_theme.dart';
import 'package:ishaar/features/lang/view_model/cubit.dart';
import 'package:ishaar/features/theme/view_model/cubit.dart';
import 'package:ishaar/l10n/app_localizations.dart';

class IshaarApp extends StatelessWidget {
  const IshaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()..initTheme()),
        BlocProvider(
          create: (context) =>
              LocalizatoinCubit()..initLanguage(context: context),
        ),
      ],
      child: Builder(
        builder: (context) {
          final themeCubit = context.watch<ThemeCubit>();
          final languageCubit = context.watch<LocalizatoinCubit>();

          return MaterialApp(
            title: 'Shoply App',
            locale: languageCubit.locale,

            localizationsDelegates: [
              ...AppLocalizations.localizationsDelegates,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: [Locale('en'), Locale('ar')],

            // Set the navigator key and route generator
            navigatorKey: AppRoutes.navigatorKey,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: AppPages.splashScreen,
            // Disable the debug banner
            debugShowCheckedModeBanner: false,
            // Set the light and dark themes
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: themeCubit.themeMode,
          );
        },
      ),
    );
  }
}
