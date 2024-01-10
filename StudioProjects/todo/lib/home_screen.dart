import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/localization_bloc.dart';
import 'package:todo/repo/task_repo.dart';
import 'generated/l10n.dart';
import 'task_bloc.dart';
import 'text_form.dart';


class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _editingIndex = -1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).task),
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
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is UpdatedTaskState) {
                  print(state.tasks);
                  return buildTaskForm(state.tasks, context);
                }
                if (state is InitialTaskState) {
                  print(state.tasks);
                  return buildTaskForm(state.tasks, context);
                }
                return Text('data');
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  if (state is UpdatedTaskState) {
                    print(state.tasks);
                    return buildTaskList(state.tasks, context);
                  }
                  if (state is InitialTaskState) {
                    print(state.tasks);
                    return buildTaskList(state.tasks, context);
                  }
                  return Text('Wait');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTaskForm(List<String> tasks, BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).enterText;
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_editingIndex == -1) {
                        BlocProvider.of<TaskBloc>(context).add(AddTaskEvent(_controller.text));
                      } else {
                        _editingIndex = -1;
                        BlocProvider.of<TaskBloc>(context).add(EditTaskEvent(_editingIndex, _controller.text));
                      }
                      _controller.clear();
                      };
                    },
                  child: Text(S.of(context).add),
                ),
              ),
            ],
          ),
        );
      },
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
                  },
                  child: TextField(
                    enabled: false,
                    controller: TextEditingController(text: tasks[index]),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _controller.text = tasks[index];
                  _editingIndex = index;
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
      builder: (context) =>
          AlertDialog(
            title: Text(S.of(context).selectLanguage),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LocalizationBloc>(context).add(
                        ChangeLocaleEvent('en_US'));
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).english),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LocalizationBloc>(context).add(
                        ChangeLocaleEvent('ru'));
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).russian),
                ),
              ],
            ),
          ),
    );
  }
}

