import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup_namer/setting/DemoSetting.dart';
import 'package:startup_namer/tabmain/MainTab.dart';

class DemoTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoTabState();
}

class DemoTabState extends State<DemoTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('_MyHomePageState');
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dehaze, color: Colors.white),
            onPressed: () {
              mainTabKey.currentState.openDrawer();
            },
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
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }

  Future<bool> _getState() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    bool state = _sp.getBool('route_state');
    return state == null ? false : state;
  }
}
