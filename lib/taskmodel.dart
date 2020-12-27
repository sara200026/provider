import 'database_helper.dart';

class Task {
  String taskname;
  int taskId;

  bool isComplete;
  Task({this.taskId, this.isComplete, this.taskname});

  Task.fromMap(Map map) {
    this.taskId = map['id'];

    this.taskname = map[DBHelper.taskNameColumnName];
    this.isComplete =
        map[DBHelper.taskIsCompleteColumnName] == 1 ? true : false;
  }
  tojson() {
    return {
      DBHelper.taskIdColumnName: this.taskId,
      DBHelper.taskNameColumnName: this.taskname,
      DBHelper.taskIsCompleteColumnName: this.isComplete ? 1 : 0
    };
  }
}
