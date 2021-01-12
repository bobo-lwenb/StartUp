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
          duration: const Duration(seconds: 1),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _opacity = _opacity == 0 ? 1.0 : 0;
          });
        },
        child: Icon(Icons.refresh_sharp),
      ),
    );
  }
}
