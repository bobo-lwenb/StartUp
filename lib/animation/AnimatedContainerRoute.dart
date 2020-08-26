import 'package:flutter/material.dart';

class AnimatedContainerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State {
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Opacity(
            opacity: 1.0,
            child: Text('AnimatedContainer'),
          ),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _size,
            height: _size,
            duration: const Duration(seconds: 2),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3333371454,3025388081&fm=26&gp=0.jpg',
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(_size == 100.0 ? 0 : 200)),
            ),
            onEnd: () {
              setState(() {
                _size = _size == 100.0 ? 200.0 : 100.0;
              });
            },
          ),
        ),
      ),
    );
  }
}
