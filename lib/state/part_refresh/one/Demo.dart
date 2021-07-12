import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int _count = 0;
  GlobalKey<_TextWidgetState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextWidget(globalKey),
        SizedBox(height: 30.0),
        Text(
          "$_count",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 30.0),
        TextButton(
          onPressed: () {
            _count++;
            globalKey.currentState?.onPressed(_count);
          },
          child: Text(
            "plus",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
    return Center(
      child: column,
    );
  }
}

class TextWidget extends StatefulWidget {
  TextWidget(Key key) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  int _text = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$_text",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  void onPressed(int count) {
    setState(() {
      _text = count;
    });
  }
}
