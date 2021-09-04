import 'package:flutter/material.dart';
import 'package:startup_namer/state/Demo.dart';
import 'package:startup_namer/state/InheritedWidgetTestRoute.dart';
import 'package:startup_namer/state/how_provider_use/ChangeNotifierProviderRoute.dart';
import 'package:startup_namer/state/how_provider_use/FutureProviderRoute.dart';
import 'package:startup_namer/state/how_provider_use/ListenableProviderRoute.dart';
import 'package:startup_namer/state/how_provider_use/ProviderRoute.dart';
import 'package:startup_namer/state/how_provider_use/StreamProviderRoute.dart';
import 'package:startup_namer/state/how_provider_use/ValueListenableProviderRoute.dart';
import 'package:startup_namer/state/inherited_model/InheritedModelRoute.dart';
import 'package:startup_namer/state/listenable/ValueListenableBuilderRoute.dart';
import 'package:startup_namer/state/part_refresh/one/Demo.dart';
import 'package:startup_namer/state/redux/redux_main.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'lifecycle/StateLifecycleTest.dart';
import 'lifecycle/WidgetsBindingRoute.dart';
import 'provider_shopping_cart/LikeProviderRoute.dart';

class StateMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateMainState();
}

class _StateMainState extends State<StateMain> {
  List<ItemData> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    list.add(ItemData('State生命周期', StateLifecycle()));
    list.add(ItemData('WidgetsBindingObserver', WidgetsBindingRoute()));
    list.add(ItemData('模仿Provider实现购物车例子', LikeProviderRoute()));
    list.add(ItemData('计数器的InheritedWidget实现1', InheritedWidgetTestRoute()));
    list.add(ItemData('计数器的InheritedWidget实现2', TopPage()));
    list.add(ItemData('InheritedModel', InheritedModelRoute()));
    list.add(ItemData('Provider', ProviderRoute()));
    list.add(ItemData('ListenableProvider', ListenableProviderRoute()));
    list.add(ItemData('ChangeNotifierProvider', ChangeNotifierProviderRoute()));
    list.add(
        ItemData('ValueListenableProvider', ValueListenableProviderRoute()));
    list.add(ItemData('FutureProvider', FutureProviderRoute()));
    list.add(ItemData('StreamProvider', StreamProviderRoute()));
    list.add(ItemData('ValueListenableBuilder', ValueListenableBuilderRoute()));
    list.add(ItemData('局部刷新1', Demo()));
    list.add(ItemData('Redux', ReduxMain()));
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
