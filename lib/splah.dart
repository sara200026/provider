import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('splash'),
        ),
        body: Center(
            child: RaisedButton(
          child: Text('get tasks'),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        )));
  }
}
