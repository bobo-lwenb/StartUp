import 'package:flutter/material.dart';

class CustomSingleChildLayoutDemo extends StatefulWidget {
  @override
  _CustomSingleChildLayoutDemoState createState() =>
      _CustomSingleChildLayoutDemoState();
}

class _CustomSingleChildLayoutDemoState
    extends State<CustomSingleChildLayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CustomSingleChildLayout")),
      body: CustomSingleChildLayout(
        delegate: CustomSingleDelagate(),
        child: FlutterLogo(size: 100),
      ),
    );
  }
}

class CustomSingleDelagate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
