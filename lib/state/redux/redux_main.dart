import 'package:flutter/material.dart';
import 'package:startup_namer/state/redux/demo/redux_demo.dart';
import 'package:startup_namer/state/redux/list_redux/pages/show_page.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

class ReduxMain extends StatefulWidget {
  const ReduxMain({Key? key}) : super(key: key);

  @override
  _ReduxMainState createState() => _ReduxMainState();
}

class _ReduxMainState extends State<ReduxMain> {
  List<ItemData> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    list.add(ItemData('简单例子', ReduxDemo()));
    list.add(ItemData('List Redux', ShowText()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
