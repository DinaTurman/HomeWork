import 'package:bloc/bloc.dart';

// События
abstract class LocalizationEvent {}

class ChangeLocaleEvent extends LocalizationEvent {
  final String locale;

  ChangeLocaleEvent(this.locale);
}

//Состояния
class LocalizationState {
  final String locale;

  LocalizationState(this.locale);
}

//BLoC
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState('en')) {
    on<ChangeLocaleEvent>(_handleChangeLocaleEvent);
  }

  void _handleChangeLocaleEvent(ChangeLocaleEvent event, Emitter<LocalizationState> emit) {
    emit(LocalizationState(event.locale));
  }
}
