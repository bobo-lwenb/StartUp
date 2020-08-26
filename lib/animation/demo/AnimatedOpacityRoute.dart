import 'package:flutter/material.dart';

class AnimatedOpacityRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _opacity = 0;
              });
            },
            child: Container(
              width: 200,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
