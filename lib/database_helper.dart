import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoprovider/taskmodel.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  Database database;
  String databaseName = 'tasks.db';
  static final String taskTableName = 'tasks';
  static final String taskIdColumnName = 'taskId';
  static final String taskNameColumnName = 'taskName';
  static final String taskIsCompleteColumnName = 'taskIsComplete';
  Future<Database> initDatabase() async {
    if (database == null) {
      return openDataBase();
    } else {
      return database;
    }
  }

  Future<Database> openDataBase() async {
    try {
      var databasesPath = await getDatabasesPath();

      String path = join(databasesPath, databaseName);

      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await createTasksTable(db);
      });
      return database;
    } on Exception catch (e) {
      print(e);
    }
  }

  createTasksTable(Database db) async {
    db.execute(
        '''CREATE TABLE $taskTableName(
      $taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
      $taskNameColumnName TEXT NOT NULL,
      $taskIsCompleteColumnName INTEGER
    )''');
  }

  Future<int> insertNewTask(Task task) async {
    try {
      database = await initDatabase();
      int rowNumber = await database.insert(taskTableName, task.tojson());
      return rowNumber;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Task>> getAllTasks() async {
    try {
      database = await initDatabase();
      List<Map<String, dynamic>> response = await database.query(taskTableName);
      List<Task> allTasks = response.map((e) => Task.fromMap(e)).toList();
      return allTasks;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  deleteTask(int id) async {
    try {
      database = await initDatabase();
      int res = await database
          .delete(taskTableName, where: '$taskIdColumnName=?', whereArgs: [id]);
      print(res);
    } on Exception catch (e) {
      print(e);
    }
  }
}
