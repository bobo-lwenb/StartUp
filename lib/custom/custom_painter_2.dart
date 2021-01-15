import 'dart:math';

import 'package:flutter/material.dart';

class SnowMan extends StatefulWidget {
  @override
  _SnowManState createState() => _SnowManState();
}

class _SnowManState extends State<SnowMan> with SingleTickerProviderStateMixin {
  Paint _paint;
  AnimationController _controller;
  final List<Snowflake> _snowflakes = List.generate(100, (index) => Snowflake());

  @override
  void initState() {
    _paint = Paint()..color = Colors.white;
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.blue, Colors.white],
              stops: [0.0, 0.7, 1.0],
            ),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              _snowflakes.forEach((snowflake) => snowflake.fall());
              return CustomPaint(
                painter: MyPainter(painter: _paint, snowflake: _snowflakes),
              );
            },
          ),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: _buildBackWidget(),
        ),
      ],
    );
  }

  Widget _buildBackWidget() {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("雪人", style: TextStyle(fontSize: 22, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Paint painter;
  final List<Snowflake> snowflake;

  MyPainter({this.painter, this.snowflake});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(size.center(Offset(0, 150)), 50, painter);
    canvas.drawOval(Rect.fromCenter(center: size.center(Offset(0, 365)), width: 200, height: 350), painter);

    snowflake.forEach((snowflake) {
      canvas.drawCircle(Offset(snowflake.x, snowflake.y), snowflake.radius, painter);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Snowflake {
  double x = Random().nextDouble() * 428;
  double y = Random().nextDouble() * 900;
  double radius = Random().nextDouble() * 2 + 2;
  double velocity = Random().nextDouble() * 2 + 2;

  void fall() {
    y += velocity;
    if (y > 950) {
      x = Random().nextDouble() * 428;
      y = 0;
      radius = Random().nextDouble() * 2 + 2;
      velocity = Random().nextDouble() * 2 + 2;
    }
  }
}
