import 'package:flutter/material.dart';

class ExerciseKeyRoute extends StatefulWidget {
  @override
  _ExerciseKeyRouteState createState() => _ExerciseKeyRouteState();
}

class _ExerciseKeyRouteState extends State<ExerciseKeyRoute> {
  final List<Color> _colors = [
    Colors.blue[100],
    Colors.blue[300],
    Colors.blue[500],
    Colors.blue[700],
    Colors.blue[900],
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Key的练习Demo"),
      ),
      body: Listener(
        onPointerDown: (PointerDownEvent event) {
          final dx = event.position.dx;
          int index = dx ~/ Box.width;
          print(index);
          _current = index;
        },
        onPointerMove: (PointerMoveEvent event) {
          final dx = event.position.dx;
          if (dx > (_current + 1) * Box.width) {
            if (_current == _colors.length - 1) return;
            Color temp = _colors[_current];
            _colors[_current] = _colors[_current + 1];
            _colors[_current + 1] = temp;
            _current++;
            setState(() {});
          } else if (dx < _current * Box.width) {
            if (_current == 0) return;
            Color temp = _colors[_current];
            _colors[_current] = _colors[_current - 1];
            _colors[_current - 1] = temp;
            _current--;
            setState(() {});
          }
        },
        child: Stack(
          children: List.generate(_colors.length, (index) {
            return Box(
              key: ValueKey(_colors[index]),
              color: _colors[index],
              x: index * Box.width,
              y: 200,
              onDrag: (Color color) {
                int index = _colors.indexOf(color);
                _current = index;
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        child: Icon(Icons.refresh_sharp),
      ),
    );
  }

  void _shuffle() {
    setState(() {
      _colors.shuffle();
    });
  }
}

class Box extends StatelessWidget {
  static const width = 50.0;
  static const height = 150.0;
  static const margin = 2.0;

  final Color color;
  final double x, y;
  final Function(Color) onDrag;

  Box({
    Key key,
    this.color,
    this.x,
    this.y,
    this.onDrag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: width - margin * 2,
      height: height - margin * 2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      left: x,
      top: y,
      child: Draggable(
        child: container,
        feedback: container,
        childWhenDragging: Visibility(
          visible: false,
          child: container,
        ),
        onDragStarted: () => onDrag(color),
      ),
    );
  }
}
