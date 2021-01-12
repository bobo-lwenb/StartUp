import 'package:flutter/material.dart';

/// TweenAnimationBuilder 是做隐式动画（补间动画）的万能方法
/// 要注意的是 tween 属性的 begin 值只有在一开始的时候起作用，然后到 end 值
/// 动画结束之后的都是由当前值变化到新值
class TweenAnimationBuilderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State {
  double _end = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TweenAnimationBuilder'),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: _end),
          duration: const Duration(seconds: 2),
          child: Image.network(
            'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3333371454,3025388081&fm=26&gp=0.jpg',
            fit: BoxFit.fill,
          ),
          builder: (context, value, child) {
            return Container(
              width: value,
              height: value,
              child: child,
            );
          },
          onEnd: () {
            setState(() {
              _end = _end == 200.0 ? 250.0 : 200.0;
            });
          },
        ),
      ),
    );
  }
}
