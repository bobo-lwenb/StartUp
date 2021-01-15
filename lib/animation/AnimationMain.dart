import 'package:flutter/material.dart';
import 'package:startup_namer/animation/implicit_animation/AnimatedContainerRoute.dart';
import 'package:startup_namer/animation/implicit_animation/AnimatedOpacityRoute.dart';
import 'package:startup_namer/animation/implicit_animation/TweenAnimationBuilderRoute.dart';
import 'package:startup_namer/animation/implicit_animation/AnimatedSwitcherRoute.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'explicit_animation/animated_builder_2.dart';
import 'explicit_animation/base_animation_2.dart';
import 'explicit_animation/breathe_widget.dart';
import 'explicit_animation/staggered_animation_1.dart';
import 'explicit_animation/animated_builder_1.dart';
import 'explicit_animation/animated_widget.dart';
import 'explicit_animation/base_animation_1.dart';
import 'explicit_animation/staggered_animation_2.dart';
import 'hero/custom/HeroAnimation.dart';
import 'hero/standard/HeroAnimationRoute.dart';
import 'implicit_animation/flip_counter.dart';

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
    list.add(ItemData('标准Hero动画', HeroAnimationRoute()));
    list.add(ItemData('自定义Hero动画', RadialExpansionDemo()));

    explicitList.add(ItemData('显式动画的基本使用_1', BaseAnimation1()));
    explicitList.add(ItemData('显式动画的基本使用_2', BaseAnimation2()));
    explicitList.add(ItemData('AnimatedWidget简化', AnimatedWidgetTestRoute()));
    explicitList.add(ItemData('AnimationBuilder重构1', AnimatedBuilder1()));
    explicitList.add(ItemData('AnimationBuilder重构2', AnimatedBuilder2()));
    explicitList.add(ItemData('交错动画_1', StaggeredAnimation1()));
    explicitList.add(ItemData('交错动画_2', StaggeredAnimation2()));
    explicitList.add(ItemData('4-7-8呼吸法', BreatheWidget()));

    implicitList.add(ItemData('AnimatedContainer', AnimatedContainerRoute()));
    implicitList.add(ItemData('AnimatedSwitcher', AnimatedSwitcherRoute()));
    implicitList.add(ItemData('AnimatedOpacity', AnimatedOpacityRoute()));
    implicitList.add(ItemData('TweenAnimationBuilder', TweenAnimationBuilderRoute()));
    implicitList.add(ItemData('数字上下滚动', FlipCounter()));
  }

  @override
  Widget build(BuildContext context) {
    Widget demo = GridViewWidget(widgets: list);
    Widget explicitTitle = Text("显式动画", style: TextStyle(fontSize: 20.0));
    Widget explicitWidget = GridViewWidget(widgets: explicitList);
    Widget implicitTitle = Text("隐式动画", style: TextStyle(fontSize: 20.0));
    Widget implicitWidget = GridViewWidget(widgets: implicitList);
    Widget body = Column(
      children: [
        demo,
        SizedBox(height: 20.0),
        explicitTitle,
        SizedBox(height: 20.0),
        explicitWidget,
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
