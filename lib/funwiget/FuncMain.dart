import 'package:flutter/material.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'InheritedWidgetTestRoute.dart';
import 'ThemeTestRoute.dart';
import 'WillPopScopeTestRoute.dart';

class FuncMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuncMainState();
}

class _FuncMainState extends State<FuncMain> {
  List<ItemData> list = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list.add(ItemData('导航返回拦截WillPopScope', WillPopScopeTestRoute()));
    list.add(ItemData('计数器的InheritedWidget实现', InheritedWidgetTestRoute()));
    list.add(ItemData('Theme演示页面', ThemeTestRoute()));
//    list.add(ItemData(DemoLocalizations.of(context).titleRoute, LogginRoute()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('功能型组件'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
