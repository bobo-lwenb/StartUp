import 'package:flutter/material.dart';

class SafeAreaDemo extends StatefulWidget {
  @override
  _SafeAreaDemoState createState() => _SafeAreaDemoState();
}

class _SafeAreaDemoState extends State<SafeAreaDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SafeArea"),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              height: 44,
              child: Center(
                child: Text("$index"),
              ),
            );
          },
          itemCount: 50,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
