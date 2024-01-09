import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task_bloc.dart';
import 'i18n/app_localizations.dart';
import 'localization_bloc.dart';


class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  int _editingIndex = -1;
  String _buttonText = 'Add Task';

  @override
  Widget build(BuildContext context) {
    final LocalizationBloc localizationBloc = BlocProvider.of<LocalizationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              _showLanguageDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_editingIndex == -1) {
                  BlocProvider.of<TaskBloc>(context).add(AddTaskEvent(_controller.text));
                } else {
                  BlocProvider.of<TaskBloc>(context).add(EditTaskEvent(_editingIndex, _controller.text));
                  _editingIndex = -1;
                  _buttonText = 'Add Task';
                }
                _controller.clear();
              },
              child: Text(_buttonText),
            ),
            SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  if (state is UpdatedTaskState) {
                    return buildTaskList(state.tasks, context);
                  }

                  return Text('Your tasks will be displayed here.');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTaskList(List<String> tasks, BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _controller.text = tasks[index];
                    _editingIndex = index;
                    _buttonText = 'Save';
                  },
                  child: TextField(
                    enabled: false,
                    controller: TextEditingController(text: tasks[index]),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _controller.text = tasks[index];
                  _editingIndex = index;
                  _buttonText = 'Save';
                },
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<TaskBloc>(context).add(DeleteTaskEvent(index));
            },
          ),
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<LocalizationBloc>(context).add(ChangeLocaleEvent('en_US'));;
                Navigator.of(context).pop();
              },
              child: Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<LocalizationBloc>(context).add(ChangeLocaleEvent('ru_RU'));;
                Navigator.of(context).pop();
              },
              child: Text('Русский'),
            ),
          ],
        ),
      ),
    );
  }
}

