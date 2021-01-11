import 'package:flutter/material.dart';
import 'package:startup_namer/funwiget/key/local_key/Student.dart';

class ValueKeyRoute extends StatefulWidget {
  @override
  State<ValueKeyRoute> createState() => _ValueKeyState();
}

class _ValueKeyState extends State<ValueKeyRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ValueKey的使用"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("name:"),
            TextField(key: ValueKey(Student("lwb", 21))),
            Text("address:"),
            TextField(key: ValueKey(Student("lwb", 22))),
          ],
        ),
      ),
    );
  }
}
