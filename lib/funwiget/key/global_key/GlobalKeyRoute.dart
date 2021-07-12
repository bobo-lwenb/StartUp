import 'package:flutter/material.dart';

class GlobalKeyRoute extends StatefulWidget {
  @override
  State<GlobalKeyRoute> createState() => _GlobalKeyState();
}

class _GlobalKeyState extends State<GlobalKeyRoute> {
  final _globalKey = GlobalKey<_CounterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GlobalKey的使用"),
      ),
      body: Center(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Counter(),
                  Center(child: Counter(_globalKey)),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Counter(),
                  Center(child: Counter(_globalKey)),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final _renderBox =
              _globalKey.currentContext?.findRenderObject() as RenderBox;
          _renderBox.size;
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  Counter([Key? key]) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          _count++;
        });
      },
      child: Text(
        "$_count",
        style: TextStyle(fontSize: 72),
      ),
    );
  }
}
