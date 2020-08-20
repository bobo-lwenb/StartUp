import 'package:flutter/material.dart';
import 'package:startup_namer/custom/CustomScrollbar.dart';
import 'package:startup_namer/custom/FlowPopCircleMenu.dart';
import 'package:startup_namer/custom/FlowPopMenu.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'CustomPaintRoute.dart';
import 'GradientCircularProgressRoute.dart';
import 'TurnBoxTestRoute.dart';

class CustomMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomMainState();
}

class _CustomMainState extends State<CustomMain> {
  List<ItemData> list = List();

  @override
  void initState() {
    super.initState();
    list.add(ItemData('旋转动画及自定义控件', TurnBoxTestRoute()));
    list.add(ItemData('自定义paint画棋盘', CustomPaintRoute()));
    list.add(ItemData('自定义圆形进度圈', GradientCircularProgressRoute()));
    list.add(ItemData('简单自定义Scrollbar', CustomScrollbar()));
    list.add(ItemData('自定义Flow菜单', FlowPopMenuRoute()));
    list.add(ItemData('自定义半圆Flow菜单', FlowPopCircleMenu()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义组件'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
