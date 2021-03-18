import 'package:flutter/material.dart';
import 'package:startup_namer/ui/DemoLayoutRoute.dart';
import 'package:startup_namer/ui/DraggableRoute.dart';
import 'package:startup_namer/ui/FilterRoute.dart';
import 'package:startup_namer/ui/Flex_Expanded.dart';
import 'package:startup_namer/ui/PageViewRoute.dart';
import 'package:startup_namer/ui/Wrap_Flow_Demo.dart';
import 'package:startup_namer/ui/button_demo.dart';
import 'package:startup_namer/ui/card_demo.dart';
import 'package:startup_namer/ui/gradient_button/GradientButtonRoute.dart';
import 'package:startup_namer/ui/layout/custom_single_child_layout.dart';
import 'package:startup_namer/ui/layout/layout_constraints.dart';
import 'package:startup_namer/ui/layout/render_object/multi_render_object_demo.dart';
import 'package:startup_namer/ui/picker/date_picker.dart';
import 'package:startup_namer/ui/picker/time_picker.dart';
import 'package:startup_namer/ui/safe_area.dart';
import 'package:startup_namer/ui/textfeild/login.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'DismissibleRoute.dart';
import 'layout/constraint_demo.dart';
import 'layout/custom_multi_childl_layout.dart';
import 'layout/layout_constraint.dart';
import 'layout/render_object/leaf_render_objec_demo.dart';
import 'layout/render_object/single_render_object_demo.dart';
import 'orientation_builder.dart';
import 'progressindicator/ProgressIndicatorRoute.dart';
import 'scaffold/ScaffoldDemo.dart';

class UIMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UIMainState();
}

class _UIMainState extends State<UIMain> {
  List<ItemData> list = List.empty(growable: true);

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
    list.add(ItemData('时间选择器', DatePicker()));
    list.add(ItemData('日期选择器', TimePicker()));
    list.add(ItemData('SafeArea', SafeAreaDemo()));
    list.add(ItemData('按钮', ButtonDemo()));
    list.add(ItemData('Card', CarsDemo()));
    list.add(ItemData('OrientationBuilder', OrientationBuilderDemo()));
    list.add(ItemData('布局约束', LayoutConstraint()));
    list.add(ItemData('布局约束样例', ConstraintDemo()));
    list.add(ItemData('理解约束布局', LayoutConstraints()));
    list.add(
        ItemData('CustomSingleChildLayout', CustomSingleChildLayoutDemo()));
    list.add(ItemData('CustomMultiChildLayout', CustomMultiChildLayoutDemom()));
    list.add(ItemData('LeafRenderObjectWidget', LeafRenderObject()));
    list.add(ItemData('SingleChildRenderObjectWidget', ShadowRenderDemo()));
    list.add(ItemData('MultiChildRenderObjectWidget', MultiRenderDemo()));
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
