import 'package:flutter/material.dart';

class CustomScrollbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomScrollbarState();
}

class _CustomScrollbarState extends State<CustomScrollbar> {
  var _alignmentY = -1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('简单自定义Scrollbar'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 50,
              itemExtent: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('$index'),
                );
              },
            ),
            Container(
              alignment: Alignment(1, _alignmentY),
              padding: EdgeInsets.only(right: 5),
              child: Container(
                height: 80,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    print('滚动组件最大滚动距离:${metrics.maxScrollExtent}');
    print('当前滚动位置:${metrics.pixels}');
    setState(() {
      _alignmentY = -1 + (metrics.pixels / metrics.maxScrollExtent) * 2;
    });
    return true;
  }
}
