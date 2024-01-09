import 'package:hive/hive.dart';

part 'localization_model.g.dart';

@HiveType(typeId: 0)
class LocalizationModel extends HiveObject {
  @HiveField(0)
  late String selectedLocale;

  LocalizationModel(this.selectedLocale);
}