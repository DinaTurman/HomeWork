import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_bloc.dart';
import 'home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/generated/l10n.dart';
import 'localization_bloc.dart';
import 'app_settings.dart';
import 'app_settings_adapter.dart';
import 'package:dio/dio.dart';
import 'repo/task_repo.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AppSettingsAdapter());
  await Hive.openBox<AppSettings>(AppSettings.boxName);
  GetIt.I.registerSingleton(TaskRepository(Dio()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationBloc>(
          create: (context) => LocalizationBloc(),
        ),
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const <LocalizationsDelegate>[
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              ...GlobalCupertinoLocalizations.delegates,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Task Manager',
            locale: state.locale,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

