import 'package:flutter/material.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'AndroidViewRoute.dart';
import 'PlatFormRoute.dart';

class PlatformMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlatformMainState();
}

class _PlatformMainState extends State<PlatformMain> {
  List<ItemData> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    list.add(ItemData('MethodChannel演示', PlatFormRoute()));
    list.add(ItemData('AndroidView简单使用', AndroidViewRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('原生交互'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
