import 'package:todo/app_settings.dart';
import 'package:hive/hive.dart';

class AppSettingsAdapter extends TypeAdapter<AppSettings> {
  @override
  final int typeId = 0;

  @override
  AppSettings read(BinaryReader reader) {
    return AppSettings(locale: reader.read());
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer.write(obj.locale);
  }
}