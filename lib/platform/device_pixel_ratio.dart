import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:startup_namer/utils/size_fit.dart';

class DevicePixelRatio extends StatefulWidget {
  const DevicePixelRatio({Key? key}) : super(key: key);

  @override
  _DevicePixelRatioState createState() => _DevicePixelRatioState();
}

class _DevicePixelRatioState extends State<DevicePixelRatio> {
  GlobalKey _valueKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    SizeFit.instance().init();
    print(window.devicePixelRatio);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      (context as Element).size;
      // RenderBox renderBox = context.findRenderObject() as RenderBox;
      RenderBox renderBox =
          (_valueKey.currentContext as Element).findRenderObject() as RenderBox;
      Offset offset1 = renderBox.localToGlobal(Offset.zero);
      Offset offset2 = renderBox.globalToLocal(Offset.zero);
      print(offset1);
      print(offset2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Window.devicePixelRatio'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          width: 400.px,
          height: 200,
          child: Center(
            child: Container(
              key: _valueKey,
              color: Colors.deepOrange,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
