import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class BusinessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BusinessState();
}

class BusinessState extends State<BusinessPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('商业功能'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have pushed the button this many times:', style: TextStyle(fontSize: 18)),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    _incrementCounter(true);
                  },
                  child: Text('增加'),
                ),
                SizedBox(
                  width: 10,
                ),
                OutlineButton(
                  onPressed: () {
                    _incrementCounter(false);
                  },
                  child: Text('减少'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String path = (await getApplicationDocumentsDirectory()).path;
    return File('$path/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String counts = await file.readAsString();
      return int.parse(counts);
    } on FileSystemException {
      return 0;
    }
  }

  void _incrementCounter(bool increment) async {
    setState(() {
      if (increment) {
        _counter++;
      } else {
        _counter--;
      }
    });
    await (await _getLocalFile()).writeAsString('$_counter');
  }
}
