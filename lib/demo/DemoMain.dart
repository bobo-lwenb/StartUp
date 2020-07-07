import 'package:flutter/material.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'TakePicturesRoute.dart';

class DemoMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoMainState();
}

class _DemoMainState extends State<DemoMain> {
  List<ItemData> list = List();

  @override
  void initState() {
    super.initState();
    list.add(ItemData('获取照片demo', TakePictureRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo合集'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
