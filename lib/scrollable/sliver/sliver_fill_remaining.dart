import 'package:flutter/material.dart';

class SliverFillRemainingDemo extends StatefulWidget {
  @override
  _SliverFillRemainingDemoState createState() => _SliverFillRemainingDemoState();
}

class _SliverFillRemainingDemoState extends State<SliverFillRemainingDemo> {
  @override
  Widget build(BuildContext context) {
    // return buildOne();
    return buildTwo(context);
  }

  Widget buildOne() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          title: Text("SliverFillRemaining"),
          expandedHeight: 255,
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.amber[300],
            height: 150.0,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            color: Colors.blue[100],
            child: Icon(
              Icons.sentiment_very_satisfied,
              size: 75,
              color: Colors.blue[900],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTwo(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          title: Text("SliverFillRemaining"),
          expandedHeight: 255,
        ),
        SliverFixedExtentList(
          itemExtent: 500.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index % 2 == 0 ? Colors.amber[200] : Colors.blue[200],
              );
            },
            childCount: 3,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            color: Colors.orange[300],
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: FlutterLogo(size: 100),
            ),
          ),
        ),
      ],
    );
  }
}
