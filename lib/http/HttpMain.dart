import 'package:flutter/material.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'HttpTestRoute.dart';
import 'WebSocketRoute.dart';
import 'httpdemo/HttpPage.dart';

class HttpMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpMainState();
}

class _HttpMainState extends State<HttpMain> {
  List<ItemData> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    list.add(ItemData('Http简单使用', HttpPage()));
    list.add(ItemData('Http请求测试', HttpTestRoute()));
    list.add(ItemData('WebSocket演示', WebSocketRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
