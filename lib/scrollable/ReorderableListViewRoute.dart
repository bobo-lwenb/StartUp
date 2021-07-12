import 'package:flutter/material.dart';

class ReorderableListViewRoute extends StatefulWidget {
  @override
  _RouteState createState() => _RouteState();
}

class _RouteState extends State<ReorderableListViewRoute> {
  List<Box> listBoxes = [
    Box(Colors.blue[100], key: UniqueKey()),
    Box(Colors.blue[300], key: UniqueKey()),
    Box(Colors.blue[500], key: UniqueKey()),
    Box(Colors.blue[700], key: UniqueKey()),
    Box(Colors.blue[900], key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Key的练习Demo"),
      ),
      body: Center(
        child: ReorderableListView(
          scrollDirection: Axis.horizontal,
          onReorder: (int oldIndex, int newIndex) {
            if (newIndex > oldIndex) newIndex--;
            var box = listBoxes.removeAt(oldIndex);
            listBoxes.insert(newIndex, box);
          },
          children: listBoxes,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        child: Icon(Icons.refresh_sharp),
      ),
    );
  }

  void _shuffle() {
    setState(() {
      listBoxes.shuffle();
    });
  }
}

class Box extends StatelessWidget {
  final _color;

  Box(this._color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 50,
      height: 50,
      color: _color,
    );
  }
}
