import 'package:flutter/material.dart';

/// AnimatedBuilder正是将渲染逻辑分离出来
class AnimatedBuilder1 extends StatefulWidget {
  @override
  _AnimationBuilder1State createState() => _AnimationBuilder1State();
}

/// 需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _AnimationBuilder1State extends State<AnimatedBuilder1>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(animation);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(); // 启动动画，正向启动
      }
    });
    controller.forward(); // 启动动画，正向启动
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder1'),
      ),
      body: Center(
        // AnimatedBuilder不仅可以从动画中分离出widget，也能把渲染过程抽象出来
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext ctx, Widget? child) {
            return Center(
              child: Container(
                height: animation.value,
                width: animation.value,
                child: child,
              ),
            );
          },
          child: Image.asset('./images/flower.jpg'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose(); // 路由销毁时需要释放动画资源
    super.dispose();
  }
}

/// Flutter中正是通过这种方式封装了很多动画，如：FadeTransition、ScaleTransition、
/// SizeTransition、FractionalTranslation等，很多时候都可以复用这些预置的过渡类。
class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({required this.child, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        child: child,
        animation: animation,
        builder: (BuildContext ctx, Widget? child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
