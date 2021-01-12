import 'package:flutter/material.dart';
import 'package:startup_namer/funwiget/key/exercise_key/ExerciseKeyRoute.dart';
import 'package:startup_namer/funwiget/key/exercise_key/sort_list.dart';
import 'package:startup_namer/funwiget/key/global_key/GlobalKeyRoute.dart';
import 'package:startup_namer/funwiget/key/local_key/KeyExampleRoute.dart';
import 'package:startup_namer/funwiget/key/local_key/ObjectKeyRoute.dart';
import 'package:startup_namer/funwiget/key/local_key/UniqueKeyRoute.dart';
import 'package:startup_namer/funwiget/key/local_key/KeyDemoRoute.dart';
import 'package:startup_namer/funwiget/key/local_key/ValueKeyRoute.dart';
import 'package:startup_namer/utils/GridViewWidget.dart';

class KeyMain extends StatefulWidget {
  @override
  _KeyMainState createState() => _KeyMainState();
}

class _KeyMainState extends State<KeyMain> {
  final List<ItemData> listLocal = List.empty(growable: true);
  final List<ItemData> listGlobal = List.empty(growable: true);
  final List<ItemData> listExercise = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    listLocal.add(ItemData("Key的作用", KeyDemoRoute()));
    listLocal.add(ItemData("ValueKey", ValueKeyRoute()));
    listLocal.add(ItemData("ObjectKey", ObjectKeyRoute()));
    listLocal.add(ItemData("UniqueKey", UniqueKeyRoute()));
    listLocal.add(ItemData("Key的例子", KeyExampleRoute()));
    listGlobal.add(ItemData("GlobalKey", GlobalKeyRoute()));
    listGlobal.add(ItemData("GlobalKey", GlobalKeyRoute()));
    listExercise.add(ItemData("拖动列表实现1", ExerciseKeyRoute()));
    listExercise.add(ItemData("拖动列表实现2", SortList()));
  }

  @override
  Widget build(BuildContext context) {
    Widget localKeyTitle = Text("LocalKey", style: TextStyle(fontSize: 20.0));
    Widget localWidget = GridViewWidget(widgets: listLocal);
    Widget globalKeyTitle = Text("GlobalKey", style: TextStyle(fontSize: 20.0));
    Widget globalWidget = GridViewWidget(widgets: listGlobal);
    Widget exerciseTitle = Text("Key的练习Demo", style: TextStyle(fontSize: 20.0));
    Widget exerciseWidget = GridViewWidget(widgets: listExercise);
    Widget body = Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        localKeyTitle,
        SizedBox(height: 20.0),
        localWidget,
        SizedBox(height: 20.0),
        globalKeyTitle,
        SizedBox(height: 20.0),
        globalWidget,
        SizedBox(height: 20.0),
        exerciseTitle,
        SizedBox(height: 20.0),
        exerciseWidget,
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Key的使用"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
