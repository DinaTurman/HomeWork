import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'task_bloc.dart';
import 'localization_bloc.dart';
import 'home_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './i18n/app_localizations.dart';



//import 'app.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), //
        Locale('ru', 'RU'),
        // Add more locales as needed
      ],
      title: 'Task Manager',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LocalizationBloc>(
            create: (context) => LocalizationBloc(),
          ),
          BlocProvider<TaskBloc>(
            create: (context) => TaskBloc(),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}

