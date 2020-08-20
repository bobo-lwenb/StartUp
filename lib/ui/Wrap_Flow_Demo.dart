import 'package:flutter/material.dart';

class WrapFlowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget wrap = Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      alignment: WrapAlignment.center,
      children: [
        Chip(avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')), label: Text('Hello world')),
        Chip(avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')), label: Text('Hello world')),
        Chip(avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')), label: Text('Hello world')),
        Chip(avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')), label: Text('Hello world')),
        Chip(avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')), label: Text('Hello world')),
      ],
    );

    Widget flow = Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: [
        new Container(width: 80.0, height: 80.0, color: Colors.red),
        new Container(width: 80.0, height: 80.0, color: Colors.green),
        new Container(width: 80.0, height: 80.0, color: Colors.blue),
        new Container(width: 80.0, height: 80.0, color: Colors.yellow),
        new Container(width: 80.0, height: 80.0, color: Colors.brown),
        new Container(width: 80.0, height: 80.0, color: Colors.purple),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('流式布局'),
      ),
      body: Column(
        children: [
          Center(
            child: wrap,
          ),
          flow,
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    // 计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        // 绘制子widget(有优化)
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
