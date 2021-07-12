import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoSettingState();
}

class DemoSettingState extends State<DemoSetting> {
  bool _check = false;

  @override
  void initState() {
    _getState().then((state) {
      setState(() {
        _check = state;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('是否通过静态路由跳转'),
            value: _check,
            onChanged: (checked) {
              setState(() {
                _check = checked;
                _changeState(checked);
              });
            },
          ),
        ],
      ),
    );
  }

  _changeState(bool state) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    await _sp.setBool('route_state', state);
  }

  Future<bool> _getState() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    bool? state = _sp.getBool('route_state');
    return state == null ? false : state;
  }
}
