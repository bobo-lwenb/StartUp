import 'package:flutter/material.dart';

/// SingleChildScrollView
class SingleChildScrollViewTestRoute extends StatelessWidget {
  final String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SingleChildScrollView'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(children: str.split("").map((c) => Text(c, textScaleFactor: 2.0)).toList()),
          ),
        ),
      ),
    );
  }
}
