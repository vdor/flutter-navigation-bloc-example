import 'package:flutter/material.dart';

class TaskDetailsPage extends StatelessWidget {
  final int taskId;

  const TaskDetailsPage(this.taskId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task #$taskId"),
      ),
      body: Center(
        child: Text(
          "Detail information about the task #$taskId",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
