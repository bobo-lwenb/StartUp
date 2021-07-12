import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicMessageChannelRoute extends StatefulWidget {
  @override
  _BasicMessageChannelState createState() => _BasicMessageChannelState();
}

class _BasicMessageChannelState extends State<BasicMessageChannelRoute> {
  String recive = 'null';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BasicMessageChannel'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () {
                var args = {
                  "method": "test",
                  "ontent": "flutter 中的数据",
                  "code": 100
                };
                _sendMessage(args);
              },
              child: Text('send'),
            ),
            Text(recive),
          ],
        ),
      ),
    );
  }

  /// 向原生发送消息
  void _sendMessage(Map args) async {
    BasicMessageChannel _basicMessageChannel = const BasicMessageChannel(
        'flutter_and_native_100', StandardMessageCodec());
    Map reply = await _basicMessageChannel.send(args);
    int code = reply["code"];
    String message = reply["message"];

    //更新 Flutter 中页面显示
    setState(() {
      recive = "code:$code message:$message";
    });
  }

  /// 接收原生主动发送的消息
  void _receiveMessage() {
    BasicMessageChannel _basicMessageChannel = const BasicMessageChannel(
        'flutter_and_native_100', StandardMessageCodec());
    _basicMessageChannel.setMessageHandler((result) async {
      //解析 原生发给 Flutter 的参数
      int code = result["code"];
      String message = result["message"];

      setState(() {
        recive = "receiveMessage: code:$code message:$message";
      });
      return 'Flutter 已收到消息';
    });
  }
}
