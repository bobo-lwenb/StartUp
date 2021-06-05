import 'dart:async';

import 'package:flutter/material.dart';

enum Department { treasury, state }

class DialogTestRoute extends StatefulWidget {
  @override
  _DialogTestRouteState createState() => new _DialogTestRouteState();
}

class _DialogTestRouteState extends State<DialogTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('对话框'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return OutlineButton(
                    child: Text('AlertDialog'),
                    onPressed: () async {
                      bool delete = await _showAlertDialog();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(delete.toString()),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ));
                    });
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return OutlineButton(
                  child: Text('SimpleDialog'),
                  onPressed: () async {
                    String result = await _showSimpleDialog();
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(result),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ));
                  },
                );
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return OutlineButton(
                  child: Text('Dialog'),
                  onPressed: () async {
                    int index = await _showDialog();
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('$index'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ));
                  },
                );
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return OutlineButton(
                  child: Text('CustomDialog'),
                  onPressed: () async {
                    bool result = await _showCustomDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("提示"),
                          content: Text("您确定要删除当前文件吗?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("取消"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            FlatButton(
                              child: Text("删除"),
                              onPressed: () {
                                // 执行删除操作
                                Navigator.of(context).pop(true);
                              },
                            ),
                          ],
                        );
                      },
                    );
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('$result'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ));
                  },
                );
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return OutlineButton(
                  child: Text('StateDialog'),
                  onPressed: () async {
                    bool delete = await _showDeleteDialog();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 显示AlertDialog
  Future<bool> _showAlertDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('提示'),
          content: Text('您确定要删除当前文件吗?'),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('确认 '),
              onPressed: () => Navigator.of(context).pop(true),
            )
          ],
        );
      },
    );
  }

  /// 显示SimpleDialog
  Future<String> _showSimpleDialog() {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              child: Padding(
                padding: EdgeInsets.all(6),
                child: const Text('中文简体'),
              ),
              onPressed: () {
                Navigator.of(context).pop('中文简体');
              },
            ),
            SimpleDialogOption(
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Text('美国英语'),
              ),
              onPressed: () {
                Navigator.of(context).pop('美国英语');
              },
            ),
          ],
        );
      },
    );
  }

  /// 显示Dialog
  Future<int> _showDialog() {
    return showDialog<int>(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("请选择"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('$index'),
                        onTap: () {
                          Navigator.of(context).pop(index);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// 自定义Dialog
  Future<T> _showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog<T>(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return theme != null
                  ? Theme(data: theme, child: pageChild)
                  : pageChild;
            },
          ),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  bool withTree = false; // 复选框选中状态

  /// 对话框状态管理
  _showDeleteDialog() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
//                  StatefulBuilder(
//                    builder: (context, _setTate) {
//                      return Checkbox(
//                        value: withTree,
//                        onChanged: (bool value) {
//                          //复选框选中状态发生变化时重新构建UI
//                          _setTate(() {
//                            //更新复选框状态
//                            withTree = !withTree;
//                          });
//                        },
//                      );
//                    },
//                  ),
                  Builder(
                    builder: (context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool value) {
                          (context as Element).markNeedsBuild();
                          withTree = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }
}
