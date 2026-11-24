import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// Title displayed on the login screen
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Label for the email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Label for the password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Welcome message displayed to the user
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Title displayed on the first onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Stay Updated with Your Company'**
  String get beautyBeginsWithAFlower;

  /// Subtitle displayed on the first onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Get the latest company news, announcements, and updates in one place.'**
  String get discoverBouquets;

  /// Title displayed on the second onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Never Miss an Important Update'**
  String get sameDayDelivery;

  /// Subtitle displayed on the second onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Receive instant notifications and stay informed about everything happening in your company.'**
  String get sameDayDeliverySubtitle;

  /// Button text used to navigate to the next onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Button text used to skip onboarding and navigate to login
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// عنوان حقل إدخال اسم المستخدم
  ///
  /// In en, this message translates to:
  /// **'اسم المستخدم'**
  String get useName;

  /// عنوان حقل إدخال البريد الإلكتروني
  ///
  /// In en, this message translates to:
  /// **'البريد الإلكتروني'**
  String get emile;

  /// رسالة تحقق تظهر عندما يكون البريد الإلكتروني غير صالح
  ///
  /// In en, this message translates to:
  /// **'أدخل بريداً إلكترونياً صحيحاً'**
  String get enterValidEmail;

  /// رسالة تحقق تظهر عندما يكون حقل كلمة المرور فارغاً
  ///
  /// In en, this message translates to:
  /// **'كلمة المرور مطلوبة'**
  String get passwordRequired;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
