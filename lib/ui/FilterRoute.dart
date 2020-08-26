import 'dart:ui';

import 'package:flutter/material.dart';

/// BackdropFilter和ImageFilter的使用
class FilterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget one = Stack(
      children: <Widget>[
        Image.asset('./images/beauty.jpg'),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Center(
              child: Container(
                color: Colors.red.withOpacity(0),
                child: Text('beauty.jpg'),
              ),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('BackdropFilter和ImageFilter'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            one,
          ],
        ),
      ),
    );
  }
}
