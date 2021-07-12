import 'package:flutter/material.dart';

class CustomMultiChildLayoutDemom extends StatefulWidget {
  @override
  _CustomMultiChildLayoutDemomState createState() =>
      _CustomMultiChildLayoutDemomState();
}

class _CustomMultiChildLayoutDemomState
    extends State<CustomMultiChildLayoutDemom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CustomMultiChildLayout")),
      body: CustomMultiChildLayout(
        delegate: CustomDelegate(),
        children: [
          LayoutId(id: 1, child: FlutterLogo()),
          LayoutId(id: 2, child: FlutterLogo(size: 150)),
        ],
      ),
    );
  }
}

class CustomDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    late Size size1, size2;
    if (hasChild(1)) {
      size1 = layoutChild(
        1,
        BoxConstraints.tightFor(width: 100, height: 100),
      );
      positionChild(1, Offset.zero);
    }
    if (hasChild(2)) {
      size2 = layoutChild(
        2,
        BoxConstraints.loose(size),
      );
      positionChild(2, Offset(0, size1.height));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
