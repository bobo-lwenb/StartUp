import 'dart:async';

import 'package:flutter/material.dart';

import 'DialogCheckbox.dart';

class DialogStateRoute extends StatefulWidget {
  @override
  _DialogStateRouteState createState() => _DialogStateRouteState();
}

class _DialogStateRouteState extends State<DialogStateRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialogState'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return OutlinedButton(
                  child: Text('DialogState'),
                  onPressed: () async {
                    bool result = await _showDeleteConfirmDialog3();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$result'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            OutlinedButton(
              child: Text("显示底部菜单列表"),
              onPressed: () async {
                int type = await _showModalBottomSheet();
                print(type);
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return OutlinedButton(
                  child: Text("显示全屏菜单列表"),
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showDeleteConfirmDialog1() {
    bool _withTree = false;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  DialogCheckbox(
                    value: _withTree,
                    onChanged: (bool value) {
                      //更新选中状态
                      _withTree = value;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _showDeleteConfirmDialog2() {
    bool _withTree = false;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时也要删除子目录？"),
                  //使用StatefulBuilder来构建StatefulWidget上下文
                  StatefulBuilder(
                    builder: (context, _setState) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (bool value) {
                          //_setState方法实际就是该StatefulWidget的setState方法，
                          //调用后builder方法会重新被调用
                          _setState(() {
                            //更新选中状态
                            _withTree = value;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _showDeleteConfirmDialog3() {
    bool _withTree = false;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("真的同时也要删除子目录？"),
                  // 通过Builder来获得构建Checkbox的`context`，
                  // 这是一种常用的缩小`context`范围的方式
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (bool value) {
                          // 此时context为对话框UI的根Element，我们
                          // 直接将对话框UI对应的Element标记为dirty
                          (context as Element).markNeedsBuild();
                          _withTree = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  // 返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                // do something
                print("$index");
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }
}
