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
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text("Delete Task"),
                          content: Text("Are you sure to Delete Task ?"),
                          actions: [
                            FlatButton(
                              child: Text("Yes"),
                              onPressed: () {
                                Provider.of<TodoProvider>(context,
                                        listen: false)
                                    .deleteTask(task.taskId);
                              },
                            ),
                            FlatButton(
                              child: Text("No"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                }),
            Text(this.task.taskname),
            Checkbox(
                value: task.isComplete,
                onChanged: (value) {
                  this.task.isComplete = value;
                  Provider.of<TodoProvider>(context, listen: false)
                      .updateTask(this.task);
                })
          ],
        ),
      ),
    );
  }
}
