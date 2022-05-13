import 'package:baseproject/l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final Locale overriddenLocale;

  const AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => ['en', 'de'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}

class AppLocalization {
  ///This load will load/set all the Localized values. You can also call this method if you wish to switch the locale of app manually.
  ///
  ///
  static Future<AppLocalization> load(Locale locale) {
    print(Intl.defaultLocale);
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;

      return AppLocalization();
    });
  }

  ///This method will return the instance of current Localization of the app. Somewhat like a factory method.
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// List of locales
  ///This getter returns the value of the heyWorld.
  ///This property is what will be using to get its translations based on locale of the app.

  String get heyWorld {
    return Intl.message(
      'Hey World',
      name: 'heyWorld',
      desc: 'Simpel word for greeting ',
    );
  }
}
