import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoprovider/taskmodel.dart';
import 'package:todoprovider/todo_provider.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.taskname),
        trailing: Checkbox(
          value: task.isComplete,
          onChanged: (value) {
            context.read<TodoProvider>().updateTask(task);
          },
        ),
      ),
    );
  }
}
