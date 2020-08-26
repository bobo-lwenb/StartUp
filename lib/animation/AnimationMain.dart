import 'package:flutter/material.dart';
import 'package:startup_namer/animation/AnimatedContainerRoute.dart';
import 'package:startup_namer/animation/demo/AnimatedOpacityRoute.dart';
import 'package:startup_namer/animation/demo/TweenAnimationBuilderRoute.dart';
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
  List<ItemData> list = List();

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
    list.add(ItemData('AnimatedOpacity', AnimatedOpacityRoute()));
    list.add(ItemData('TweenAnimationBuilder', TweenAnimationBuilderRoute()));
    list.add(ItemData('AnimatedContainer', AnimatedContainerRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
