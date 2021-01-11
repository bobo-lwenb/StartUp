import 'package:flutter/material.dart';
import 'package:startup_namer/funwiget/key/local_key/Student.dart';

class ObjectKeyRoute extends StatefulWidget {
  @override
  State<ObjectKeyRoute> createState() => _ObjectKeyState();
}

class _ObjectKeyState extends State<ObjectKeyRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ObjectKey的使用"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("name:"),
            TextField(key: ObjectKey(Student("lwb", 22))),
            Text("address:"),
            TextField(key: ObjectKey(Student("lwb", 22))),
          ],
        ),
      ),
    );
  }
}
