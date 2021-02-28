import 'package:flutter/material.dart';

class OrientationBuilderDemo extends StatefulWidget {
  @override
  _OrientationBuilderDemoState createState() => _OrientationBuilderDemoState();
}

class _OrientationBuilderDemoState extends State<OrientationBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OrientationBuilder"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              direction: orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
