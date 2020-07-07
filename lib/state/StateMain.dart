import 'package:flutter/material.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'lifecycle/StateLifecycleTest.dart';
import 'lifecycle/WidgetsBindingRoute.dart';
import 'provider_shopping_cart/ProviderRoute.dart';

class StateMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateMainState();
}

class _StateMainState extends State<StateMain> {
  List<ItemData> list = List();

  @override
  void initState() {
    super.initState();
    list.add(ItemData('State生命周期', StateLifecycle()));
    list.add(ItemData('WidgetsBindingObserver', WidgetsBindingRoute()));
    list.add(ItemData('基本Provider实现购物车例子', ProviderRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('状态管理'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
