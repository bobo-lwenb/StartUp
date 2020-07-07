import 'package:flutter/material.dart';

/// 简单样式的进度条
class IndicatorRoute extends StatefulWidget {
  @override
  _IndicatorRouteState createState() => _IndicatorRouteState();
}

class _IndicatorRouteState extends State<IndicatorRoute> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _controller.addListener(() => setState(() => {}));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进度指示器'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(
                value: 0.4,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.grey, end: Colors.blue).animate(_controller), // 从灰色变成蓝色
                value: _controller.value,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
