import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repo/task_repo.dart';

// События
abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String taskName;

  AddTaskEvent(this.taskName);
}

class EditTaskEvent extends TaskEvent {
  final int index;
  final String newTaskName;

  EditTaskEvent(this.index, this.newTaskName);
}

class DeleteTaskEvent extends TaskEvent {
  final int index;

  DeleteTaskEvent(this.index);
}

// Состояния
abstract class TaskState {}

class InitialTaskState extends TaskState {
  final List<String> tasks;

  InitialTaskState(this.tasks);
}

class UpdatedTaskState extends TaskState {
  final List<String> tasks;

  UpdatedTaskState(this.tasks);
}

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<String> tasks = [];

  TaskBloc() : super(InitialTaskState([])) {
    _initializeTasks();
    on<AddTaskEvent>(_mapAddTaskToState);
    on<EditTaskEvent>(_mapEditTaskToState);
    on<DeleteTaskEvent>(_mapDeleteTaskToState);
  }

  void _mapAddTaskToState(AddTaskEvent event, Emitter<TaskState> emit) {
    tasks.add(event.taskName);
    emit(UpdatedTaskState(List.from(tasks)));
  }

  void _mapEditTaskToState(EditTaskEvent event, Emitter<TaskState> emit) {
    tasks[event.index] = event.newTaskName;
    emit(UpdatedTaskState(List.from(tasks)));
  }

  void _mapDeleteTaskToState(DeleteTaskEvent event, Emitter<TaskState> emit) {
    tasks.removeAt(event.index);
    emit(UpdatedTaskState(List.from(tasks)));
  }

  Future<void> _initializeTasks() async {
    try {
      var fetchTasks = await GetIt.I<TaskRepository>().fetchTasks();
      emit(InitialTaskState(List.from(fetchTasks.take(5))));
      tasks = List.from(fetchTasks.take(5));
    } catch (e) {
      print('Ошибка при получении данных: $e');
    }
  }
}
