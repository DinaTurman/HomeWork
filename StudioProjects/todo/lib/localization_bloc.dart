import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/app_settings.dart';
import 'package:hive/hive.dart';

part 'localization_event.dart';
part 'localization_state.dart';



class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final Box<AppSettings> _settingsBox = Hive.box<AppSettings>(AppSettings.boxName);

  LocalizationBloc() : super(_getInitialState()) {
    on<ChangeLocaleEvent>(_mapChangeLocaleToState);
}

  // static LocalizationState _getInitialState() {
  //   final AppSettings? settings = Hive.box<AppSettings>(AppSettings.boxName).get(0);
  //   if (settings != null) {
  //     return LocaleChanged(Locale(settings.locale ?? 'en', ''));
  //   }
  //   return LocaleChanged(Locale('en', ''));
  // }
  //late final Box<AppSettings> _settingsBox;

  // LocalizationBloc() : super(LocaleChanged(Locale('en', 'US'))) {
  //   on<ChangeLocaleEvent>(_mapChangeLocaleToState);
  // }
  // LocalizationBloc() : super() {
  //   on<ChangeLocaleEvent>(_mapChangeLocaleToState);
  // }
  static LocalizationState _getInitialState() {
    print('kkk');
    final AppSettings? settings = Hive.box<AppSettings>(AppSettings.boxName).get(0);
    if (settings != null) {
    return LocaleChanged(Locale(settings.locale ?? 'en', ''));
    }
    return LocaleChanged(Locale('en', ''));
  }

  void _mapChangeLocaleToState(ChangeLocaleEvent event, Emitter<LocalizationState> emit) {
    final newLocale = Locale(event.locale, '');
    _settingsBox.put(0, AppSettings(locale: event.locale));
    emit(LocaleChanged(Locale(event.locale, '')));
  }
}


// }
// LocalizationBloc() : super(_getInitialState()) {
// on<ChangeLocaleEvent>(_mapChangeLocaleToState);
// }
// static LocalizationState _getInitialState() {
// print('kkk');
// final AppSettings? settings = Hive.box<AppSettings>(AppSettings.boxName).get(0);
// if (settings != null) {
// return LocaleChanged(Locale(settings.locale ?? 'en', ''));
// }
// return LocaleChanged(Locale('en', ''));
// }
//z
// void _mapChangeLocaleToState(ChangeLocaleEvent event, Emitter<LocalizationState> emit) {
// final newLocale = Locale(event.locale, '');
// _settingsBox.put(0, AppSettings(locale: event.locale));
// emit(LocaleChanged(newLocale));
// }
// }

// class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
//   LocalizationBloc() : super(LocaleChanged('en', 'US')) {
//     on<ChangeLocaleEvent>(_mapChangeLocaleToState);
//   }
//
//   void _mapChangeLocaleToState(ChangeLocaleEvent event, Emitter<LocalizationState> emit) {
//     emit(LocaleChanged(Locale(event.locale, '')));
//   }
// }