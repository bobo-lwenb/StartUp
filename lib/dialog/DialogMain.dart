import 'package:flutter/material.dart';
import 'package:startup_namer/dialog/DialogStateRoute.dart';
import 'package:startup_namer/dialog/DialogTestRoute.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

class DialogMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DialogMainState();
}

class _DialogMainState extends State<DialogMain> {
  List<ItemData> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    list.add(ItemData('常用对话框', DialogTestRoute()));
    list.add(ItemData('状态对话框', DialogStateRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('对话框'),
      ),
      body: GridViewWidget(widgets: list),
    );
  }
}
