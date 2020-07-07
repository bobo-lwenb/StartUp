import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() => new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!"; //保存事件名

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => _updateText('onTap'),
          onDoubleTap: () => _updateText('onDoubleTap'),
          onLongPress: () => _updateText('onLongPress'),
        ),
      ),
    );
  }

  void _updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}
