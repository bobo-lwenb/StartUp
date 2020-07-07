import 'package:flutter/material.dart';

/// Animation基本构成
class BaseAnimationRoute extends StatefulWidget {
  @override
  _BaseAnimationRouteState createState() => new _BaseAnimationRouteState();
}

// 需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _BaseAnimationRouteState extends State<BaseAnimationRoute> with SingleTickerProviderStateMixin {
  // 用于保存动画的插值和状态
  Animation<double> animation;

  // 用于控制动画
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    // 传入的vsync参数用于接受屏幕刷新
    controller = new AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // 添加动画的线性过程的描述，作用在AnimationController上
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    // 用于改变动画值的范围，作用在Animation上
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画基本基本使用'),
      ),
      body: Center(
        child: Image.asset('./images/flower.jpg', width: animation.value, height: animation.value),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose(); // 路由销毁时需要释放动画资源
    super.dispose();
  }
}
