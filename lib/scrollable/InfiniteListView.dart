import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/// 无限加载列表
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loadingTag##';
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('InfiniteListView'),
      ),
      body: new ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: _words.length,
        separatorBuilder: (context, index) => Divider(
          height: .0,
        ),
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _retrieveData();
              return new Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            } else {
              return new Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text('no more..', style: new TextStyle(color: Colors.grey)),
              );
            }
          }
          return new ListTile(
            title: new Center(child: Text(_words[index])),
          );
        },
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1, generateWordPairs().take(10).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }
}
