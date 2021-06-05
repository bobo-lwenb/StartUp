import 'package:flutter/material.dart';

class AnimatedBuilder2 extends StatefulWidget {
  @override
  _AnimatedBuilder2State createState() => _AnimatedBuilder2State();
}

class _AnimatedBuilder2State extends State<AnimatedBuilder2>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation opacityAnimation;
  Animation heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
    heightAnimation =
        Tween<double>(begin: 100.0, end: 300.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedBuilder2"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: opacityAnimation.value,
              child: Container(
                width: 300,
                height: heightAnimation.value,
                color: Colors.deepOrange,
                child: child,
              ),
            );
          },
          child: Center(
            child: Text("Hello World!"),
          ),
        ),
      ),
    );
  }
}
