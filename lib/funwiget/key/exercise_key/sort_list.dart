import 'package:flutter/material.dart';

class SortList extends StatefulWidget {
  @override
  _SortListState createState() => _SortListState();
}

class _SortListState extends State<SortList> {
  final _colors = [
    Colors.blue[100],
    Colors.blue[300],
    Colors.blue[500],
    Colors.blue[700],
    Colors.blue[900],
  ];

  int _slot = 0;

  _shuffle() {
    setState(() => _colors.shuffle());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动列表"),
      ),
      body: Listener(
        onPointerMove: (event) {
          final y = event.position.dy;

          if (y > (_slot + 1) * Box.height) {
            if (_slot == _colors.length - 1) return;
            setState(() {
              final c = _colors[_slot];
              _colors[_slot] = _colors[_slot + 1];
              _colors[_slot + 1] = c;
              _slot++;
            });
          } else if (y < _slot * Box.height) {
            if (_slot == 0) return;
            setState(() {
              final c = _colors[_slot];
              _colors[_slot] = _colors[_slot - 1];
              _colors[_slot - 1] = c;
              _slot--;
            });
          }
        },
        child: Stack(
          children: List.generate(_colors.length, (i) {
            return Box(
              color: _colors[i]!,
              x: 70,
              y: i * Box.height,
              onDrag: (Color color) {
                final index = _colors.indexOf(color);
                print("on drag $index");
                _slot = index;
              },
              key: ValueKey(_colors[i]),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        child: Icon(Icons.refresh),
      ),
    );
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
        borderRadius: BorderRadius.circular(8.0),
      ),
    );

    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      left: x,
      top: y,
      child: Draggable(
        onDragStarted: () => onDrag(color),
        child: container,
        feedback: container,
        childWhenDragging: Visibility(
          visible: false,
          child: container,
        ),
      ),
    );
  }
}
