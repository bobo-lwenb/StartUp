import 'package:flutter/material.dart';

class PointerEventTestRoute extends StatefulWidget {
  @override
  _PointerEventTestRouteState createState() =>
      new _PointerEventTestRouteState();
}

class _PointerEventTestRouteState extends State<PointerEventTestRoute> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PointerEvent'),
      ),
      body: new Listener(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 300.0,
            height: 150.0,
            child: new Text(_event?.toString() ?? "",
                style: TextStyle(color: Colors.white)),
          ),
        ),
        onPointerDown: (PointerEvent event) => setState(() => _event = event),
        onPointerMove: (PointerEvent event) => setState(() => _event = event),
        onPointerUp: (PointerEvent event) => setState(() => _event = event),
      ),
    );
  }
}
