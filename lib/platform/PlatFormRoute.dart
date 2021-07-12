import 'package:flutter/material.dart';
import 'package:startup_namer/platform/channel/BasicMessageChannelRoute.dart';
import 'package:startup_namer/platform/channel/EventChannelRoute.dart';
import 'package:startup_namer/platform/channel/MethodChannelRoute.dart';

class PlatFormRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("平台通道"),
        ),
        body: Material(
          child: Center(
            child: Column(
              children: <Widget>[
                _item(context, "MethodChannel", MethodChannelRoute()),
                _item(context, "EventChannel", EventChannelRoute()),
                _item(
                    context, "BasicMessageChannel", BasicMessageChannelRoute()),
              ],
            ),
          ),
        ));
  }

  _item(BuildContext context, String title, route) {
    return ElevatedButton(
        child: Text(title),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return route;
              },
            ),
          );
        });
  }
}
