import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/bloc.dart';
import 'package:flutter_navigation_bloc_example/router/bloc/events.dart';
import 'package:flutter_navigation_bloc_example/router/page_configs/configs.dart';

class Task {
  final int id;
  final String name;
  const Task(this.id, this.name);

  @override
  String toString() {
    return "#$id - $name";
  }
}

final tasks = List.generate(20, (index) => Task(index + 1, "Task #$index"));

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                _goToSettings(context);
              })
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(tasks[index].toString()),
            onTap: () {
              _goToDetails(context, tasks[index].id);
            },
          );
        },
        itemCount: tasks.length,
      ),
    );
  }

  _goToSettings(BuildContext context) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterPushEvent(
        SettingsConfig(),
      ),
    );
  }

  _goToDetails(BuildContext context, int id) {
    BlocProvider.of<RouterBloc>(context).add(
      RouterPushEvent(
        TaskDetailPageConfig.byTaskId(id),
      ),
    );
  }
}
