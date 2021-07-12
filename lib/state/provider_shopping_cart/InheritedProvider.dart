import 'package:flutter/material.dart';

/// *****************************
///
/// 重点有以下几点：
/// 1、需要全局共享的数据继承自ChangeNotifier，这样数据便可以自己发布数据更新
/// 2、消息订阅者通过封装一个StatefulWidget，将子Widget树缓存起来，这样在更新数据的时候，
///   就不会让整个子树更新，而只会通知和InheritedWidget有注册关系的子组件更新自身
///
/// *****************************

/// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  // 共享状态使用泛型
  final T data;

  InheritedProvider({
    required this.data,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    /// 在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

// 该方法用于在Dart中获取模板类型
Type _type<D>() {
  return D;
}

/// 消息订阅者
///
/// 通过封装一个StatefulWidget，将子Widget树缓存起来
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T data;
  final Widget child;

  const ChangeNotifierProvider({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  // 定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context, {bool listen = true}) {
    final type = _type<InheritedProvider<T>>();
    // final provider = listen
    //     ? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>
    //     : context.ancestorInheritedElementForWidgetOfExactType(type)?.widget as InheritedProvider<T>;
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
            ?.widget as InheritedProvider<T>;
    return provider!.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  // 调用notifyListeners时触发的回调
  // 如果数据发生变化（model类调用了notifyListeners），则在此调用setState来重新构建InheritedProvider
  void update() {
    setState(() => {});
  }

  @override
  void initState() {
    // 给model添加监听器，这样ChangeNotifierProvider就是消息订阅者了
    widget.data.addListener(update);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('_ChangeNotifierProviderState');
    // 订阅者在build方法中与InheritedWidget实现了绑定
    return InheritedProvider<T>(
      data: widget.data,
      // 注意，在_ChangeNotifierProviderState类中调用setState()方法，自己就会进行更新，但是widget.child始终是同一个，
      // 所以执行build时，InheritedProvider的child引用的始终是同一个子widget，
      // 所以widget.child并不会重新build，这也就相当于对child进行了缓存！
      // 但是数据更新了，所以会通知和InheritedWidget有注册关系的子组件更新自身
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    // 当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }
}

// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget {
  Consumer({
    Key? key,
    required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);

  final Widget? child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context), //自动获取Model
    );
  }
}
