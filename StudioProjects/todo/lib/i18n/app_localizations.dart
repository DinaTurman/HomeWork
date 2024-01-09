import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: 'Greeting',
    );
  }

// Добавьте другие строки локализации по мере необходимости
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  bool isSupported(Locale locale) {
    return ['en_US', 'ru_RU'].contains(locale.toString());
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations());
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

