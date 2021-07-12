import 'package:flutter/material.dart';

import 'MyNotification.dart';

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() => new _NotificationRouteState();
}

class _NotificationRouteState extends State<NotificationRoute> {
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          msg += notification.msg + "";
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    child: Text('Send Notification'),
                    onPressed: () =>
                        MyNotification(' Hi => ').dispatch(context),
                  );
                },
              ),
              Text(msg),
            ],
          ),
        ),
      ),
    );
  }
}
