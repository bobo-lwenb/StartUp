import 'package:flutter/material.dart';

/// SliverAppBar 的简单实用
class SliverAppBarDemo extends StatefulWidget {
  @override
  _SliverAppBarDemoState createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    SliverAppBar sliverAppBar = SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      expandedHeight: 255,
      // title: Text("SliverAppBar"),
      // centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text("SliverAppBar"),
        centerTitle: true,
      ),
    );
    SliverList sliverList = SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 44,
            child: Center(
              child: Text("$index"),
            ),
          );
        },
        childCount: 50,
      ),
    );
    return CustomScrollView(
      slivers: [
        sliverAppBar,
        sliverList,
      ],
    );
  }
}
