import 'package:flutter/material.dart';

class ExerciseKeyRoute extends StatefulWidget {
  @override
  _ExerciseKeyRouteState createState() => _ExerciseKeyRouteState();
}

class _ExerciseKeyRouteState extends State<ExerciseKeyRoute> {
  final List<Color?> _colors = [
    Colors.blue[100],
    Colors.blue[200],
    Colors.blue[300],
    Colors.blue[400],
    Colors.blue[500],
    Colors.blue[600],
    Colors.blue[700],
    Colors.blue[800],
    Colors.blue[900],
  ];
  int _current = 0;
  GlobalKey _stackKey = GlobalKey();
  double _offsetY = 0;

  @override
  Widget build(BuildContext context) {
    Future(() {
      RenderBox box = _stackKey.currentContext?.findRenderObject() as RenderBox;
      _offsetY = box.localToGlobal(Offset.zero).dy;
      print(_offsetY);
    });

    Widget stack = Stack(
      key: _stackKey,
      children: List.generate(_colors.length, (index) {
        return Box(
          key: ValueKey(_colors[index]),
          color: _colors[index]!,
          x: 0,
          y: index * Box.height,
          onDrag: (Color color) {
            int index = _colors.indexOf(color);
            _current = index;
          },
        );
      }),
    );

    Listener listener = Listener(
      onPointerDown: (PointerDownEvent event) {
        final dy = event.position.dy - _offsetY;
        int index = dy ~/ Box.height;
        print(index);
        _current = index;
      },
      onPointerMove: (PointerMoveEvent event) {
        final dy = event.position.dy - _offsetY;
        if (dy > (_current + 1) * Box.height) {
          if (_current == _colors.length - 1) return;
          Color temp = _colors[_current]!;
          _colors[_current] = _colors[_current + 1];
          _colors[_current + 1] = temp;
          _current++;
          setState(() {});
        } else if (dy < _current * Box.height) {
          if (_current == 0) return;
          Color temp = _colors[_current]!;
          _colors[_current] = _colors[_current - 1];
          _colors[_current - 1] = temp;
          _current--;
          setState(() {});
        }
      },
      child: SizedBox(
        width: Box.width,
        child: stack,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Key的练习Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Welcome!",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: listener,
            ),
          ],
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
  static const width = 250.0;
  static const height = 50.0;
  static const margin = 2.0;

  final Color color;
  final double x, y;
  final Function(Color) onDrag;

  Box({
    Key? key,
    required this.color,
    required this.x,
    required this.y,
    required this.onDrag,
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
      duration: const Duration(milliseconds: 150),
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
