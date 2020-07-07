import 'package:flutter/material.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

import 'webview_flutter.dart';

class WebMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WebMainState();
}

class _WebMainState extends State<WebMain> {
  List<ItemData> list = List();

  @override
  void initState() {
    super.initState();
    list.add(ItemData('webview_flutter示例', WebViewFlutter()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
