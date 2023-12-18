import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_bloc.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is UpdatedTaskState) {
            return buildTaskList(state.tasks, context);
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildTaskList(List<String> tasks, BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _showTaskDialog(context, index: index);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<TaskBloc>(context).add(DeleteTaskEvent(index));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTaskDialog(BuildContext context, {int? index}) {
    String taskName = index != null ? BlocProvider.of<TaskBloc>(context).tasks[index] : '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(index != null ? 'Edit Task' : 'Add Task'),
        content: TextField(
          controller: TextEditingController(text: taskName),
          onChanged: (value) {
            taskName = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (index != null) {
                BlocProvider.of<TaskBloc>(context).add(EditTaskEvent(index, taskName));
              } else {
                BlocProvider.of<TaskBloc>(context).add(AddTaskEvent(taskName));
              }
              Navigator.of(context).pop();
            },
            child: Text(index != null ? 'Save' : 'Add'),
          ),
        ],
      ),
    );
  }
}
