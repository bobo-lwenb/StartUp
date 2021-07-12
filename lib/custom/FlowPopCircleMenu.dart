import 'dart:math';

import 'package:flutter/material.dart';

class FlowPopCircleMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<FlowPopCircleMenu> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      lowerBound: 0,
      upperBound: 80,
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget flow = Positioned.fill(
      child: Flow(
        delegate: FlowPopCircleDelegate(radius: _controller.value),
        children: _buildFlowChildren(),
      ),
    );

    Widget button = Positioned.fill(
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          setState(() {
            _controller.status == AnimationStatus.completed
                ? _controller.reverse()
                : _controller.forward();
          });
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('半圆浮动菜单'),
      ),
      body: Stack(
        children: [
          flow,
          button,
        ],
      ),
    );
  }

  List<Widget> _buildFlowChildren() {
    return List.generate(
      5,
      (index) => Container(
        child: Icon(
          index.isEven ? Icons.timer : Icons.ac_unit,
          color: Colors.primaries[index % Colors.primaries.length],
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

class FlowPopCircleDelegate extends FlowDelegate {
  FlowPopCircleDelegate({required this.radius});

  final double radius; //绑定半径,让圆动起来

  @override
  void paintChildren(FlowPaintingContext context) {
    if (radius == 0) {
      return;
    }
    var x = 0.0;
    var y = 0.0;
    for (int i = 0; i < context.childCount; i++) {
      x = radius * cos(i * pi / (context.childCount - 1)); //根据数学得出坐标
      y = radius * sin(i * pi / (context.childCount - 1)); //根据数学得出坐标
      context.paintChild(i, transform: Matrix4.translationValues(x, -y, 0));
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) => true;
}
