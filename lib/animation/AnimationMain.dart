import 'package:flutter/material.dart';
import 'package:startup_namer/animation/implicit_animation/AnimatedContainerRoute.dart';
import 'package:startup_namer/animation/implicit_animation/AnimatedOpacityRoute.dart';
import 'package:startup_namer/animation/implicit_animation/TweenAnimationBuilderRoute.dart';
import 'package:startup_namer/animation/implicit_animation/AnimatedSwitcherRoute.dart';
import 'package:startup_namer/animation/implicit_animation/flip_counter.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'ScaleAnimationTestRoute.dart';
import 'StaggerTestRoute.dart';
import 'demo/AnimatedBuilderRoute.dart';
import 'demo/AnimatedWidgetRoute.dart';
import 'demo/BaseAnimationRoute.dart';
import 'route/hero/custom/HeroAnimation.dart';
import 'route/hero/standard/HeroAnimationRoute.dart';

class AnimationMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationMainState();
}

class _AnimationMainState extends State<AnimationMain> {
  List<ItemData> list = List.empty(growable: true);
  List<ItemData> explicitList = List.empty(growable: true);
  List<ItemData> implicitList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    list.add(ItemData('动画的基本使用', BaseAnimationRoute()));
    list.add(ItemData('AnimatedWidget简化', AnimatedWidgetTestRoute()));
    list.add(ItemData('AnimationBuilder重构', AnimationBuilderRoute()));
    list.add(ItemData('ScaleAnimation示例', ScaleAnimation()));
    list.add(ItemData('标准Hero动画', HeroAnimationRoute()));
    list.add(ItemData('自定义Hero动画', RadialExpansionDemo()));
    list.add(ItemData('交错动画', StaggerTestRoute()));

    implicitList.add(ItemData('AnimatedContainer', AnimatedContainerRoute()));
    implicitList.add(ItemData('AnimatedSwitcher', AnimatedSwitcherRoute()));
    implicitList.add(ItemData('AnimatedOpacity', AnimatedOpacityRoute()));
    implicitList.add(ItemData('TweenAnimationBuilder', TweenAnimationBuilderRoute()));
    implicitList.add(ItemData('数字上下滚动', FlipCounter()));
  }

  @override
  Widget build(BuildContext context) {
    Widget demo = GridViewWidget(widgets: list);
    Widget implicitTitle = Text("隐式动画", style: TextStyle(fontSize: 20.0));
    Widget implicitWidget = GridViewWidget(widgets: implicitList);
    Widget body = Column(
      children: [
        demo,
        SizedBox(height: 20.0),
        implicitTitle,
        SizedBox(height: 20.0),
        implicitWidget,
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画'),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
