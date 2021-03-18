import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MultiRenderDemo extends StatefulWidget {
  @override
  _MultiRenderDemoState createState() => _MultiRenderDemoState();
}

class _MultiRenderDemoState extends State<MultiRenderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MultiChildRenderObjectWidget")),
      body: MultiDemo(),
    );
  }
}

class MultiDemo extends MultiChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMultiDemo();
  }
}

class RenderMultiDemo extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData> {
}
