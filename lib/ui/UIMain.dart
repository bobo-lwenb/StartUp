import 'package:flutter/material.dart';
import 'package:startup_namer/ui/DemoLayoutRoute.dart';
import 'package:startup_namer/ui/DraggableRoute.dart';
import 'package:startup_namer/ui/FilterRoute.dart';
import 'package:startup_namer/ui/Flex_Expanded.dart';
import 'package:startup_namer/ui/PageViewRoute.dart';
import 'package:startup_namer/ui/Wrap_Flow_Demo.dart';
import 'package:startup_namer/ui/gradient_button/GradientButtonRoute.dart';
import 'package:startup_namer/ui/textfeild/login.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'DismissibleRoute.dart';
import 'progressindicator/ProgressIndicatorRoute.dart';
import 'scaffold/ScaffoldDemo.dart';

class UIMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UIMainState();
}

class _UIMainState extends State<UIMain> {
  List<ItemData> list = List();

  @override
  void initState() {
    super.initState();
    list.add(ItemData('Scaffold页面结构', ScaffoldDemo()));
    list.add(ItemData('TextFiled的使用', LoginRoute()));
    list.add(ItemData('进度指示器', IndicatorRoute()));
    list.add(ItemData('Flex和Expanded', FlexAndExpanded()));
    list.add(ItemData('布局Demo', DemoLayoutRoute()));
    list.add(ItemData('Dismissible左右滑动操作', DismissibleRoute()));
    list.add(ItemData('按钮背景色渐变', GradientButtonRoute()));
    list.add(ItemData('流式布局', WrapFlowDemo()));
    list.add(ItemData('PageView的使用', PageViewRoute()));
    list.add(ItemData('BackdropFilter和ImageFilter', FilterRoute()));
    list.add(ItemData('Draggable、DragTarget', DraggableRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础UI组件'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
