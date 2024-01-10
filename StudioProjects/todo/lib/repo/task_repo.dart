import 'package:dio/dio.dart';

class TaskRepository {
  final Dio dio;

  TaskRepository(this.dio);

  Future<List<String>> fetchTasks() async {
    try {
      final response = await Dio().get('https://jsonplaceholder.typicode.com/todos');
      final List<dynamic> data = response.data;
      print(data.map((task) => task['title'] as String).toList());
      return data.map((task) => task['title'] as String).toList();
    } catch (error) {
      throw Exception('Failed to load tasks');
    }
  }
}