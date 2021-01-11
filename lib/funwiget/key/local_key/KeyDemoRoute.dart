import 'package:flutter/material.dart';

class KeyDemoRoute extends StatefulWidget {
  @override
  State<KeyDemoRoute> createState() => _KeyDemoState();

  KeyDemoRoute({Key key}) : super(key: key);
}

class _KeyDemoState extends State<KeyDemoRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Key的作用"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Box(Colors.red, key: ValueKey(1)),
            Center(child: Box(Colors.red, key: ValueKey(2))),
            Box(Colors.red, key: ValueKey(3)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color _color;

  Box(this._color, {Key key}) : super(key: key);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: widget._color,
      child: Center(
        child: FlatButton(
          onPressed: () => setState(() => _count++),
          child: Text(
            "$_count",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
