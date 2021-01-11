import 'dart:math';

import 'package:flutter/material.dart';

class KeyExampleRoute extends StatefulWidget {
  @override
  State<KeyExampleRoute> createState() => _KeyExampleState();
}

class _KeyExampleState extends State<KeyExampleRoute> {
  List<Widget> _container = [
    Container(width: 100, height: 100, color: Colors.red),
    Container(width: 100, height: 100, color: Colors.blue)
  ];

  List<Widget> _boxes = [
    Box(key: UniqueKey()),
    Box(key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Key的实例"),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _container,
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _boxes,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // StatelessWidget 则是在Widget改变时重建
            Widget temp = _container.removeLast();
            _container.insert(0, temp);

            // 其中是 UniqueKey 在发生作用
            // 在 StatefulWidget 位置发生变化时，让State跟着变化
            // 如果没有 UniqueKey 的话状态是不会跟随的
            Widget tempBox = _boxes.removeLast();
            _boxes.insert(0, tempBox);
          });
        },
        child: Icon(Icons.call),
      ),
    );
  }
}

class Box extends StatefulWidget {
  @override
  _BoxState createState() => _BoxState();

  Box({Key key}) : super(key: key);
}

class _BoxState extends State<Box> {
  final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
