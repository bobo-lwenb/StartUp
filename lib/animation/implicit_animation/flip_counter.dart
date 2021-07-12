import 'package:flutter/material.dart';

class FlipCounter extends StatefulWidget {
  @override
  _FlipCounterState createState() => _FlipCounterState();
}

class _FlipCounterState extends State<FlipCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数字上下滚动"),
      ),
      body: Center(
        child: Container(
          color: Colors.indigo,
          height: 110,
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1000),
            tween: Tween<double>(begin: 7, end: 12),
            builder: (BuildContext context, double value, Widget? child) {
              final integer = value ~/ 1;
              final decimals = value - integer;
              return Stack(
                children: <Widget>[
                  Positioned(
                    top: -100 * decimals,
                    child: Opacity(
                      opacity: 1 - decimals,
                      child: Text("$integer", style: TextStyle(fontSize: 100)),
                    ),
                  ),
                  Positioned(
                    top: (1 - decimals) * 100,
                    child: Opacity(
                      opacity: decimals,
                      child: Text("${integer + 1}",
                          style: TextStyle(fontSize: 100)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
