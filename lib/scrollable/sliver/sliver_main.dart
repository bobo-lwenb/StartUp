import 'package:flutter/material.dart';
import 'package:startup_namer/scrollable/sliver/sliver_demo.dart';
import 'package:startup_namer/scrollable/sliver/sliver_persistent_header_demo1.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';
import 'custom_scrollview_demo.dart';
import 'nested_scrollview_demo.dart';
import 'sliver_appbar_demo.dart';
import 'sliver_fill_remaining.dart';
import 'sliver_fill_viewport.dart';
import 'sliver_persistent_header_demo.dart';
import 'sliver_to_box_adapter.dart';

class SliverMain extends StatelessWidget {
  final List<ItemData> _list = [
    ItemData('SliverDemo', SliverDemo()),
    ItemData('SliverAppBar', SliverAppBarDemo()),
    ItemData('SliverPersistentHeader0', SliverPersistentHeaderDemo()),
    ItemData('SliverPersistentHeader1', PersistentHeader()),
    ItemData('SliverToBoxAdapter', SliverToBoxAdapterDemo()),
    ItemData('SliverFillRemaining', SliverFillRemainingDemo()),
    ItemData('SliverFillViewport', SliverFillViewportDemo()),
    ItemData('CustomScrollView', CustomScrollViewDemo()),
    ItemData('NestedScrollView', NestedScroll()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver Widgets'),
      ),
      body: GridViewWidget(widgets: _list),
    );
  }
}
