import 'package:flutter/material.dart';

class StaggeredAnimation2 extends StatefulWidget {
  @override
  _StaggeredAnimation2State createState() => _StaggeredAnimation2State();
}

class _StaggeredAnimation2State extends State<StaggeredAnimation2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交错动画2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlidingBox(
                controller: _controller,
                color: Colors.red[100]!,
                interval: Interval(0.0, 0.2)),
            SlidingBox(
                controller: _controller,
                color: Colors.red[300]!,
                interval: Interval(0.2, 0.4)),
            SlidingBox(
                controller: _controller,
                color: Colors.red[500]!,
                interval: Interval(0.4, 0.6)),
            SlidingBox(
                controller: _controller,
                color: Colors.red[700]!,
                interval: Interval(0.6, 0.8)),
            SlidingBox(
                controller: _controller,
                color: Colors.red[900]!,
                interval: Interval(0.8, 1.0)),
          ],
        ),
      ),
    );
  }
}

class SlidingBox extends StatelessWidget {
  final AnimationController controller;
  final Color color;
  final Interval interval;

  SlidingBox({
    required this.controller,
    required this.color,
    required this.interval,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: Offset(0.2, 0.0))
          .chain(CurveTween(curve: Curves.bounceOut))
          .chain(CurveTween(curve: interval))
          .animate(controller),
      child: Container(
        height: 100,
        width: 300,
        color: color,
      ),
    );
  }
}
