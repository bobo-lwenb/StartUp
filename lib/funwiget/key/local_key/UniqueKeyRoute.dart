import 'package:flutter/material.dart';

class UniqueKeyRoute extends StatefulWidget {
  @override
  State<UniqueKeyRoute> createState() => _UniqueKeyState();
}

class _UniqueKeyState extends State<UniqueKeyRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("name:"),
            TextField(key: UniqueKey()),
            Text("address:"),
            TextField(key: UniqueKey()),
            SizedBox(height: 50),
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: Text(
                "Hello",
                key: UniqueKey(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
