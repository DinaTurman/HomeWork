import 'package:flutter_bloc/flutter_bloc.dart';


// События
abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String taskName;

  AddTaskEvent(this.taskName);
}

class EditTaskEvent extends TaskEvent {
  final int index;
  final String taskName;

  EditTaskEvent(this.index, this.taskName);
}

class DeleteTaskEvent extends TaskEvent {
  final int index;

  DeleteTaskEvent(this.index);
}

// Состояния
abstract class TaskState {}

class InitialTaskState extends TaskState {}

class UpdatedTaskState extends TaskState {
  final List<String> tasks;

  UpdatedTaskState(this.tasks);
}

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(InitialTaskState());

  List<String> tasks = [];

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is AddTaskEvent) {
      tasks.add(event.taskName);
      print('jjjjjjj');
    } else if (event is EditTaskEvent) {
      tasks[event.index] = event.taskName;
    } else if (event is DeleteTaskEvent) {
      tasks.removeAt(event.index);
    }

    yield UpdatedTaskState(List.from(tasks));
  }
}