// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// //import 'features/tasks/data/repositories/task_repository.dart';
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Task App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyTaskScreen(),
//     );
//   }
// }
//
// class MyTaskScreen extends StatefulWidget {
//   @override
//   _MyTaskScreenState createState() => _MyTaskScreenState();
// }
//
// class _MyTaskScreenState extends State<MyTaskScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Tasks'),
//       ),
//       body: FutureBuilder(
//         future: Hive.openBox('tasksBox'),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return TaskList();
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
//
// class TaskList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final tasksBox = Hive.box('tasksBox');
//
//     return ListView.builder(
//       itemCount: tasksBox.length,
//       itemBuilder: (context, index) {
//         final task = tasksBox.getAt(index) as String;
//         return ListTile(
//           title: Text(task),
//           // Добавьте кнопки для редактирования и удаления задачи
//           // onPressed: () {
//           //   // Реализация редактирования задачи
//           // },
//           // onLongPress: () {
//           //   // Реализация удаления задачи
//           // },
//         );
//       },
//     );
//   }
// }
