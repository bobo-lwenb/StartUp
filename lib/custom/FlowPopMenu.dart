import 'package:flutter/material.dart';

class FlowPopMenuRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<FlowPopMenuRoute> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  IconData lastTap = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    //菜单的icon
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('浮动菜单'),
      ),
      body: Center(
        child: Flow(
          delegate: FlowMenuDelegate(animation: _controller),
          children: menuItems.map((e) => _menuItem(e)).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _menuItem(IconData iconData) {
    final double buttonDiameter = MediaQuery.of(context).size.width * 2 / (menuItems.length * 3);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RawMaterialButton(
        fillColor: lastTap == iconData ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updateMenu(iconData);
        },
        child: Icon(
          iconData,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }

  void _updateMenu(IconData iconData) {
    if (iconData != Icons.menu) {
      setState(() {
        lastTap = iconData;
      });
    } else {
      _controller.status == AnimationStatus.completed ? _controller.reverse() : _controller.forward();
    }
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({this.animation}) : super(repaint: animation);

  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = 50.0;
    var y = 50.0;
    for (int i = 0; i < context.childCount; i++) {
      x = context.getChildSize(i).width * i * animation.value;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return super.getSize(constraints);
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
