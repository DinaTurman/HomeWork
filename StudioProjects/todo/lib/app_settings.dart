import 'package:hive/hive.dart';

class AppSettings {
  static const String boxName = 'app_settings';

  String? locale;

  AppSettings({this.locale});
}
