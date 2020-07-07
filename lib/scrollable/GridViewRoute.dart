import 'dart:async';

import 'package:flutter/material.dart';

/// 网格布局GridView和下拉上拉刷新
class GridViewRoute extends StatefulWidget {
  @override
  _GridViewState createState() => _GridViewState();
}

class _GridViewState extends State<GridViewRoute> {
  List<String> names = [
    '黄浦区',
    '徐汇区',
    '长宁区',
    '静安区',
    '普陀区',
    '闸北区',
    '虹口区',
    '越秀',
    '海珠',
    '荔湾',
    '天河',
    '白云',
    '黄埔',
    '南沙',
    '番禺',
    '南山',
    '福田',
    '罗湖',
    '盐田',
    '龙岗',
    '宝安',
    '龙华'
  ];

  bool isLoadMore = false;

  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          isLoadMore = true;
        });
        _loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网格布局GridView'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          RefreshIndicator(
            child: Scrollbar(
              child: GridView.count(
                controller: _controller,
                crossAxisCount: 2,
                children: names.map((name) => _buildItem(name)).toList(),
              ),
            ),
            onRefresh: () => _handleRefresh(),
          ),
          Positioned(
            bottom: 50,
            child: Container(
              child: isLoadMore ? CircularProgressIndicator() : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String name) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(name),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    return null;
  }

  void _loadMore() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      isLoadMore = false;
      List<String> list = List<String>.from(names);
      names.addAll(list);
    });
  }
}
