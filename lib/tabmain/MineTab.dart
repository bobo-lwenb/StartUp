import 'package:flutter/material.dart';
import 'package:startup_namer/animation/AnimationMain.dart';
import 'package:startup_namer/async/AsyncMain.dart';
import 'package:startup_namer/custom/CustomMain.dart';
import 'package:startup_namer/demo/DemoMain.dart';
import 'package:startup_namer/dialog/DialogMain.dart';
import 'package:startup_namer/events/EventsMain.dart';
import 'package:startup_namer/funwiget/FuncMain.dart';
import 'package:startup_namer/http/HttpMain.dart';
import 'package:startup_namer/platform/PlatformMain.dart';
import 'package:startup_namer/scrollable/ScrollableMain.dart';
import 'package:startup_namer/state/StateMain.dart';
import 'package:startup_namer/ui/UIMain.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';
import 'package:startup_namer/web/WebMain.dart';

class MineTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MineTebState();
}

class MineTebState extends State {
  List<ItemData> list = List();

  @override
  void initState() {
    super.initState();
    list.add(ItemData("动画", AnimationMain()));
    list.add(ItemData("可滚动组件", ScrollableMain()));
    list.add(ItemData("事件通知", EventsMain()));
    list.add(ItemData("对话框", DialogMain()));
    list.add(ItemData("基础UI组件", UIMain()));
    list.add(ItemData("自定义组件", CustomMain()));
    list.add(ItemData("功能型组件", FuncMain()));
    list.add(ItemData("异步", AsyncMain()));
    list.add(ItemData("http", HttpMain()));
    list.add(ItemData("Demo合集", DemoMain()));
    list.add(ItemData("状态管理", StateMain()));
    list.add(ItemData("原生交互", PlatformMain()));
    list.add(ItemData("web", WebMain()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridViewWidget(widgets: list),
    );
  }
}
