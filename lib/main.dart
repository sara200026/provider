import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoprovider/splah.dart';
import 'package:todoprovider/todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (BuildContext context) {
        return TodoProvider();
      },
      child: MaterialApp(
        home: Splash(),
      ),
    );
  }
}
