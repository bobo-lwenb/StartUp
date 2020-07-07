import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<String> items = <String>['1', '2', '3', '4', '5'];

  void _reverse() {
    setState(() {
      items = items.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return KeepAlive(
                data: items[index],
                key: ValueKey<String>(items[index]),
              );
            },
            childCount: items.length,
            findChildIndexCallback: (Key key) {
              final ValueKey valueKey = key;
              final String data = valueKey.value;
              return items.indexOf(data);
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () => _reverse(),
              child: Text('Reverse items'),
            ),
          ],
        ),
      ),
    );
  }
}

class KeepAlive extends StatefulWidget {
  const KeepAlive({Key key, this.data}) : super(key: key);

  final String data;

  @override
  _KeepAliveState createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text(widget.data);
  }
}
