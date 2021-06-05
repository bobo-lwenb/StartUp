import 'package:flutter/material.dart';

class SliverDemo extends StatefulWidget {
  @override
  _SliverDemoState createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SliverDemo')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FlutterLogo(size: 100),
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 200,
                color: Colors.primaries[index % 18],
              );
            }, childCount: 50),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 200,
                color: Colors.primaries[index % 18],
              );
            }),
          ),
        ],
      ),
    );
  }
}
