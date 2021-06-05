import 'package:flutter/material.dart';

class LayoutConstraints extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LayoutConstraints> {
  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      color: Colors.red,
      // padding: const EdgeInsets.all(20.0),
      child: Container(
        color: Colors.green,
        width: 30,
        height: 30,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Constraints'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          debugPrint("$constraints");
          debugPrint(
              WidgetsBinding.instance.window.devicePixelRatio.toString());
          return container;
        },
      ),
    );
  }
}
