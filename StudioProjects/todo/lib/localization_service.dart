// localization_service.dart

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'localization_model.dart';

class LocalizationService {
  final Box<LocalizationModel> _box = Hive.box<LocalizationModel>('localization');

  String get selectedLocale => _box.values.isNotEmpty ? _box.values.first.selectedLocale : '';

  Future<void> saveLocale(String locale) async {
    final model = LocalizationModel(locale);
    await _box.clear(); // Чтобы сохранить только одну локаль, предварительно очистим ящик.
    await _box.add(model);
  }
}

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<LocalizationService>(LocalizationService());
}
