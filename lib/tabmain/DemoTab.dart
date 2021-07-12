import 'package:flutter/material.dart';
import 'package:startup_namer/setting/DemoSetting.dart';
import 'package:startup_namer/tabmain/MainTab.dart';

class DemoTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoTabState();
}

class DemoTabState extends State<DemoTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _title = ["Flutter", "Dart", "Kotlin"];

  @override
  void initState() {
    _tabController = TabController(length: _title.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dehaze, color: Colors.white),
            onPressed: () => mainTabKey.currentState?.openDrawer(),
          );
        }),
        title: Text('Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_high),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DemoSetting();
              }));
            },
          ),
        ],
        bottom: TabBar(
          tabs: _title.map((e) => Tab(text: e)).toList(),
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Center(child: Text("Flutter")),
          Center(child: Text("Dart")),
          Center(child: Text("Kotlin")),
        ],
      ),
    );
  }
}
