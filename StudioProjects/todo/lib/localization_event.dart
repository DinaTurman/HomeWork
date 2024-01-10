part of 'localization_bloc.dart';

@immutable
abstract class LocalizationEvent {
}

class ChangeLocaleEvent extends LocalizationEvent {
  final String locale;

  ChangeLocaleEvent(this.locale);
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
//
// void _mapChangeLocaleToState(ChangeLocaleEvent event, Emitter<LocalizationState> emit) {
// final newLocale = Locale(event.locale, '');
// _settingsBox.put(0, AppSettings(locale: event.locale));
// emit(LocaleChanged(newLocale));
// }
// }