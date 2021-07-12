import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelRoute extends StatefulWidget {
  @override
  _MethodChannelState createState() => _MethodChannelState();
}

class _MethodChannelState extends State<MethodChannelRoute> {
  static const _methodChannel =
      const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'Unknown battery level.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MethodChannel'),
      ),
      body: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                child: new Text('Get Battery Level'),
                onPressed: _sendMsg,
              ),
              new Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }

  /// 向原生发送消息
  Future<Null> _sendMsg() async {
    String batteryLevel;
    try {
      final int result = await _methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  /// 接收原生主动发送的消息
  void _reciveMsg() {
    _methodChannel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'getContent') {
        setState(() {
          _batteryLevel = call.arguments ?? '';
        });
      }
    });
  }
}
