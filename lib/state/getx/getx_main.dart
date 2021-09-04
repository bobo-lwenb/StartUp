import 'package:flutter/material.dart';
import 'package:startup_namer/state/getx/getx_counter/getx_counter.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

class GetXDemo extends StatefulWidget {
  GetXDemo({Key? key}) : super(key: key);

  @override
  _GetXDemoState createState() => _GetXDemoState();
}

class _GetXDemoState extends State<GetXDemo> {
  final List<ItemData> _list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _list.add(ItemData('Getx计数器', Main()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Getx')),
      body: GridViewWidget(
        widgets: _list,
      ),
    );
  }
}
