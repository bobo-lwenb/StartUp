import 'package:flutter/material.dart';

/// SliverPersistentHeader 的使用
class SliverPersistentHeaderDemo extends StatefulWidget {
  @override
  _SliverPersistentHeaderDemoState createState() => _SliverPersistentHeaderDemoState();
}

class _SliverPersistentHeaderDemoState extends State<SliverPersistentHeaderDemo> {
  @override
  Widget build(BuildContext context) {
    SliverPersistentHeader header = SliverPersistentHeader(
      delegate: _DemoSliverPersistentHeaderDelegate(),
      pinned: true,
      floating: false,
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
      slivers: <Widget>[
        header,
        sliverList,
      ],
    );
  }
}

class _DemoSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.deepOrangeAccent,
      alignment: Alignment.center,
      child: Text("SliverPersistentHeader"),
    );
  }

  @override
  double get maxExtent => 255.0;

  @override
  double get minExtent => 75.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
