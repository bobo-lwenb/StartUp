import 'package:flutter/material.dart';

/// 要想让 AnimatedSwitcher 产生动画效果
/// 它的 child 属性的 Widget 必须前后不是同一个 Widget
/// 如果只是 Widget 的内部属性改变，按照Flutter的机制，会被判定还是同一个 Widget
/// 除了使用 Key
class AnimatedSwitcherRoute extends StatefulWidget {
  @override
  _AnimatedSwitcherRouteState createState() => _AnimatedSwitcherRouteState();
}

class _AnimatedSwitcherRouteState extends State<AnimatedSwitcherRoute> {
  String _text = "Hello";
  bool _flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("隐式动画:AnimatedSwitcher"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          width: 300,
          height: 300,
          color: Colors.cyan,
          child: AnimatedSwitcher(
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            duration: const Duration(milliseconds: 1000),
            child: Text(
              "$_text",
              style: TextStyle(fontSize: 72),
              key: UniqueKey(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _text = _flag ? "Hello" : "Hi";
            _flag = !_flag;
          });
        },
        child: Icon(Icons.switch_camera_outlined),
      ),
    );
  }
}
