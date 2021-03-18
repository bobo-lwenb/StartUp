import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShadowRenderDemo extends StatefulWidget {
  @override
  _RenderDemoState createState() => _RenderDemoState();
}

class _RenderDemoState extends State<ShadowRenderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SingleChildRenderObjectWidget")),
      body: Container(
        color: Colors.blue[100],
        child: ShadowBox(
            distance: 18,
            child: Icon(
              Icons.ac_unit_outlined,
              size: 100,
            )),
      ),
    );
  }
}

class ShadowBox extends SingleChildRenderObjectWidget {
  final double distance;
  ShadowBox({this.distance, Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderShadowBox(distance: distance);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderShadowBox renderObject) {
    renderObject.distance = distance;
  }
}

class RenderShadowBox extends RenderBox
    with RenderObjectWithChildMixin, DebugOverflowIndicatorMixin {
  double distance;

  RenderShadowBox({this.distance});

  @override
  void performLayout() {
    child.layout(constraints, parentUsesSize: true);
    size = (child as RenderBox).size;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child, offset);
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(child, offset + Offset(distance, distance));
    });
    paintOverflowIndicator(
      context,
      offset,
      offset & size,
      offset & (child as RenderBox).size,
    );
  }
}
