import 'package:flutter/material.dart';
import 'package:todoprovider/taskmodel.dart';

import 'database_helper.dart';

class TodoProvider extends ChangeNotifier {
  List<Task> allTasks = [];
  List<Task> completedTasks = [];
  List<Task> inCompletedTasks = [];

  alltask() {
    getCompletedTasks();
    getInCompletedTasks();
    notifyListeners();
  }

  newTask(Task task) {
    allTasks.add(task);
    alltask();
  }

  updateTask(Task task) {
    int index = allTasks.indexOf(task);
    allTasks[index].isComplete = !allTasks[index].isComplete;

    alltask();
  }

  getCompletedTasks() {
    List<Task> tasks =
        allTasks.where((element) => element.isComplete == true).toList();

    this.completedTasks = tasks;
  }

  getallTasks() {
    List<Task> tasks = allTasks;
    this.allTasks = tasks;
  }

  deleteTask(int id) async {
    await DBHelper.dbHelper.deleteTask(id);
    alltask();
  }

  getInCompletedTasks() {
    List<Task> tasks =
        allTasks.where((element) => element.isComplete == false).toList();
    this.inCompletedTasks = tasks;
  }
}
