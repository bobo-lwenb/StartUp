import 'package:flutter/material.dart';
import 'package:startup_namer/scrollable/AnimatedListRoute.dart';
import 'package:startup_namer/scrollable/ExpansionTileRoute.dart';
import 'package:startup_namer/scrollable/GridViewRoute.dart';
import 'package:startup_namer/scrollable/InfiniteListView.dart';
import 'package:startup_namer/scrollable/ListViewCustomRoute.dart';
import 'package:startup_namer/scrollable/ListViewTestRoute.dart';
import 'package:startup_namer/scrollable/ScrollControllerTestRoute.dart';
import 'package:startup_namer/scrollable/SingleChildScrollViewRoute.dart';
import 'package:startup_namer/scrollable/SliverRoute.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

class ScrollableMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollableMainState();
}

class _ScrollableMainState extends State<ScrollableMain> {
  List<ItemData> list = List();

  @override
  void initState() {
    super.initState();
    list.add(ItemData('SingleChildScrollView组件', SingleChildScrollViewTestRoute()));
    list.add(ItemData('ListView组件', ListViewTestRoute()));
    list.add(ItemData('ListView.custom组件', MyListView()));
    list.add(ItemData('无限加载ListView', InfiniteListView()));
    list.add(ItemData('GridView组件演示上拉下拉刷新', GridViewRoute()));
    list.add(ItemData('ExpansionTile演示', ExpansionTileRoute()));
    list.add(ItemData('ScrollController用法', ScrollControllerTestRoute()));
    list.add(ItemData('Sliver演示', CustomScrollViewRoute()));
    list.add(ItemData('AnimatedList', AnimatedListRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('可滚动组件'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
