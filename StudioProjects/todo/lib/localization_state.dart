part of 'localization_bloc.dart';

@immutable
abstract class LocalizationState {
  final Locale locale;

  const LocalizationState(this.locale);
}

class LocaleChanged extends LocalizationState {

  const LocaleChanged(locale) : super(locale);
}

// abstract class LocalizationState {}
//
// //class LocalizationInitial extends LocalizationState {}
//
// class LocaleChanged extends LocalizationState {
//   final Locale locale;
//
//   LocaleChanged(this.locale);
// }
