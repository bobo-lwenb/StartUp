import 'package:flutter/material.dart';

class SliverToBoxAdapterDemo extends StatefulWidget {
  @override
  _SliverToBoxAdapterDemoState createState() => _SliverToBoxAdapterDemoState();
}

class _SliverToBoxAdapterDemoState extends State<SliverToBoxAdapterDemo> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 255,
            child: AppBar(
              title: Text("SliverToBoxAdapter"),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                title: Text("$index"),
              );
            },
          ),
        ),
      ],
    );
  }
}
