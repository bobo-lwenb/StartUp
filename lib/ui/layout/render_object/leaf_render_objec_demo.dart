import 'package:flutter/material.dart';

class LeafRenderObject extends StatefulWidget {
  @override
  _LeafRenderObjectState createState() => _LeafRenderObjectState();
}

class _LeafRenderObjectState extends State<LeafRenderObject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LeafRenderObjectWidget")),
      body: LeafDemo(),
    );
  }
}

class LeafDemo extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderLeafDemo();
  }
}

class RenderLeafDemo extends RenderBox {}
