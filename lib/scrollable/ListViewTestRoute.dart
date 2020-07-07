import 'package:flutter/material.dart';

/// listview的基本用法
class ListViewTestRoute extends StatelessWidget {
  final Widget _dividerGreen = Divider(color: Colors.green);
  final Widget _dividerBlue = Divider(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListViewTest'),
      ),
      body: new Scrollbar(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 100,
          itemExtent: 50.0,
          itemBuilder: (context, index) {
            return ListTile(
              title: new Center(
                child: new Text("$index"),
              ),
            );
          },
        ),
      ),
//      body: new Scrollbar(
//        child: new Column(
//          children: <Widget>[
//            ListTile(
//              title: new Center(child: Text('??')),
//            ),
//            Expanded(
//              child: ListView.separated(
//                itemCount: 100,
//                itemBuilder: (context, index) {
//                  return ListTile(
//                    title: new Center(
//                      child: new Text('$index'),
//                    ),
//                  );
//                },
//                separatorBuilder: (context, index) {
//                  return index % 2 == 0 ? _dividerBlue : _dividerGreen;
//                },
//              ),
//            ),
//          ],
//        ),
//      ),
    );
  }
}
