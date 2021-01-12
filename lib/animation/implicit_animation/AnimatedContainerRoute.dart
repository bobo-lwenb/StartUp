import 'package:flutter/material.dart';

/// AnimatedContainer 可以感知自己属性的变化而做出动画效果
/// 但是除了 child 属性除外
class AnimatedContainerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('隐式动画:AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.blue, Colors.white],
            ),
            boxShadow: [BoxShadow(spreadRadius: 20, blurRadius: 20)],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh_rounded),
      ),
    );
  }
}
