import 'package:flutter/material.dart';
import 'package:startup_namer/async/stream/StreamRoute.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

class AsyncMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AsyncMainState();
}

class _AsyncMainState extends State<AsyncMain> {
  List<ItemData> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    list.add(ItemData('Stream的使用', StreamRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('功能型组件'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
