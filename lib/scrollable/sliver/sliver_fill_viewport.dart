import 'package:flutter/material.dart';

class SliverFillViewportDemo extends StatefulWidget {
  @override
  _SliverFillViewportDemoState createState() => _SliverFillViewportDemoState();
}

class _SliverFillViewportDemoState extends State<SliverFillViewportDemo> {
  List _colors = [
    Colors.red[50],
    Colors.red[100],
    Colors.red[200],
    Colors.red[300],
    Colors.red[400],
    Colors.red[500],
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          title: Text("SliverFillViewport"),
          expandedHeight: 255,
        ),
        SliverFillViewport(
          viewportFraction: 1,
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              child: Text('Item $index'),
              alignment: Alignment.center,
              color: _colors[index % 4],
            );
          }, childCount: 5),
        ),
      ],
    );
  }
}
