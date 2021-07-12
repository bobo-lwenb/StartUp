import 'package:flutter/material.dart';

class DraggableRoute extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DraggableRoute> {
  var _dragData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable'),
      ),
      body: Center(
        child: Column(
          children: [
            _buildDraggable(),
            SizedBox(height: 200),
            _buildDragTarget(),
          ],
        ),
      ),
    );
  }

  Widget _buildDraggable() {
    Widget _child = Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '孟',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
    Widget _feedback = Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: Colors.white, fontSize: 18),
        child: Text(
          '孟',
        ),
      ),
    );
    return Draggable(
      data: Color(0x000000FF),
      child: _child,
      feedback: _feedback,
    );
  }

  Widget _buildDragTarget() {
    Widget _empty = Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red),
      ),
    );
    Widget _content = Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '孟',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return _dragData == null ? _empty : _content;
      },
      onWillAccept: (color) {
        return true;
      },
      onAccept: (color) {
        setState(() {
          _dragData = color;
        });
      },
      onLeave: (color) {},
    );
  }
}
