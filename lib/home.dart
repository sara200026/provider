import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoprovider/task_widget.dart';
import 'package:todoprovider/taskmodel.dart';
import 'package:todoprovider/todo_provider.dart';

import 'new_task.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewTask()),
                );
              },
            ),
          ],
          bottom: TabBar(tabs: [
            Tab(
              text: ('all_tasks'),
            ),
            Tab(
              text: ('complete_tasks'),
            ),
            Tab(
              text: ('incomplete_tasks'),
            )
          ]),
          title: Text(('My Tasks')),
        ),
        body: Container(
            child: TabBarView(children: [
          AllTasks(),
          CompleteTasks(),
          InCompleteTasks(),
        ])),
      ),
    );
  }
}

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value, child) {
        List<Task> allTasks = value.allTasks;
        return allTasks.length > 0
            ? ListView.builder(
                itemCount: allTasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(allTasks[index]);
                },
              )
            : Container();
      },
    );
  }
}

class CompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<TodoProvider, List<Task>>(
      selector: (context, todoProvider) => todoProvider.completedTasks,
      builder: (context, value, child) {
        List<Task> completedTasks = value;
        return completedTasks.length > 0
            ? ListView.builder(
                itemCount: completedTasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(completedTasks[index]);
                },
              )
            : Container();
      },
    );
  }
}

class InCompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<TodoProvider, List<Task>>(
      selector: (context, todoProvider) => todoProvider.inCompletedTasks,
      builder: (context, value, child) {
        List<Task> inCompletedTasks = value;
        return inCompletedTasks.length > 0
            ? ListView.builder(
                itemCount: inCompletedTasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(inCompletedTasks[index]);
                },
              )
            : Container();
      },
    );
  }
}
