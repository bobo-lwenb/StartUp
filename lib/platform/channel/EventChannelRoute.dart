import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelRoute extends StatefulWidget {
  @override
  _EventChannelState createState() => _EventChannelState();
}

class _EventChannelState extends State<EventChannelRoute> {
  static const _eventChannel =
      const EventChannel('samples.flutter.io/EventChannel');
  late String showMsg;
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    _streamSubscription = _eventChannel
        .receiveBroadcastStream()
        .listen(_onToDart, onError: (_onToDartError));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EventChannel'),
        ),
        body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
            margin: EdgeInsets.only(top: 70),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: _onTextChanged,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('click'),
                ),
              ],
            )));
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  void _onToDart(message) {
    setState(() {
      showMsg = message;
    });
  }

  void _onToDartError(error) {
    print(error);
  }

  void _onTextChanged(String value) async {
    String response;
//    try{
//
//    }
  }
}
