import 'package:flutter/material.dart';

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() =>
      _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget'),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child:
                    _TestWidget(), // setState会调用build方法，而此时会重新new一个_TestWidget，无法做到缓存，将更新整个子树
              ),
              ElevatedButton(
                child: Text('Increment'),
                onPressed: () => setState(() => ++count),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      /// 使用InheritedWidget中的共享数据
      ShareDataWidget.of(context, true)!.data.toString(),
    );
  }

  /// 父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
  /// 如果build中没有依赖InheritedWidget，则此回调不会被调用。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class ShareDataWidget extends InheritedWidget {
  final int data;

  ShareDataWidget({
    required this.data,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    /// 如果返回true，则子树中依赖(build函数中有调用)本widget
    /// 的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
  }

  /// 定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context, bool rebuild) {
    if (rebuild) {
      // 有注册关系，所以子孙组件的didChangeDependencies()方法和build()方法都会调用
      return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>(
          aspect: ShareDataWidget);
    } else {
      // 没有注册关系，所以之后当InheritedWidget发生变化时，就不会更新相应的子孙Widget。
      return context
          .getElementForInheritedWidgetOfExactType<ShareDataWidget>()!
          .widget as ShareDataWidget;
    }
  }
}
