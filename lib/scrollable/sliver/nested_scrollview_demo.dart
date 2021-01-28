import 'package:flutter/material.dart';

class NestedScroll extends StatefulWidget {
  @override
  _NestedScrollState createState() => _NestedScrollState();
}

class _NestedScrollState extends State<NestedScroll> {
  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = ['Tab 1', 'Tab 2'];
    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: const Text('Books'),
                pinned: true,
                expandedHeight: 250.0,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: _tabs.map((String name) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        sliver: SliverFixedExtentList(
                          itemExtent: 48.0,
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ListTile(
                                title: Text('Item $index'),
                              );
                            },
                            childCount: 30,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
