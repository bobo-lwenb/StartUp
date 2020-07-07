import 'dart:async';

import 'package:flutter/material.dart';

class WidgetsBindingRoute extends StatefulWidget {
  @override
  WidgetsBindingState createState() => WidgetsBindingState();
}

class WidgetsBindingState extends State<WidgetsBindingRoute> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetsBindingObserver'),
      ),
      body: Text('WidgetsBindingObserver'),
    );
  }

  // 当主机告诉应用将新路线推送到导航器时调用。
  @override
  Future<bool> didPushRoute(String route) {
    return super.didPushRoute(route);
  }

  // 当系统告诉应用弹出当前路线时调用。
  // 按照注册顺序通知观察者，直到观察者返回true。 如果没有返回真，则应用程序退出。
  @override
  Future<bool> didPopRoute() {
    return super.didPopRoute();
  }

  // 当应用程序尺寸更改时调用。 例如，当手机旋转时。
  // 此方法公开来自[Window.onMetricsChanged]的通知。
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
  }

  // 当平台的文本比例因子更改时调用。
  // 这通常是由于用户更改系统偏好设置而发生的，并且应该影响应用程序中的所有文本大小。
  // 此方法公开来自[Window.onTextScaleFactorChanged]的通知。
  @override
  void didChangeTextScaleFactor() {
    super.didChangeTextScaleFactor();
  }

  // {@macro on_platform_brightness_change}
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
  }

  // 当系统告知应用程序用户的语言环境已更改时调用。 例如，如果用户更改系统语言设置。
  // 此方法公开来自[Window.onLocaleChanged]的通知。
  @override
  void didChangeLocales(List<Locale> locale) {
    super.didChangeLocales(locale);
  }

  // 当系统将应用程序置于后台或将应用程序返回至前台时调用。
  // [WidgetsBindingObserver]类的源码文档中提供了实现此方法的示例。
  // 此方法公开来自[SystemChannels.lifecycle]的通知。
  //
  // 生命周期变化时对应的状态
  // resumed:应用可见并可响应用户操作
  // inactive:用户可见，但不可响应用户操作
  // paused:已经暂停了，用户不可见、不可操作
  // suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint('AppLifecycleState: $state');
  }

  // 当系统更改当前活动的辅助功能集时调用。
  // 此方法公开来自[Window.onAccessibilityFeaturesChanged]的通知。
  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
  }

  // 当系统内存不足时调用。
  // 此方法从[SystemChannels.system]中公开“memoryPressure”通知。
  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
  }
}
