import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoprovider/taskmodel.dart';
import 'package:todoprovider/todo_provider.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String name;

  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        child: Container(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: ('task name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                onChanged: (value) {
                  this.name = value;
                },
              ),
            ),
            CheckboxListTile(
              title: Text('isComplete'),
              value: this.isComplete,
              onChanged: (value) {
                setState(() {
                  this.isComplete = value;
                });
              },
            ),
            RaisedButton(
                child: Text('Add New Task'),
                onPressed: () {
                  Provider.of<TodoProvider>(context, listen: false)
                      .newTask(Task(
                    taskname: this.name,
                    isComplete: this.isComplete,
                  ));
                  Navigator.pop(context);
                })
          ],
        )),
      ),
    );
  }
}
