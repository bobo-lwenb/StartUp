import 'package:flutter/material.dart';

/// 滚动控制
class ScrollControllerTestRoute extends StatefulWidget {
  @override
  ScrollControllerState createState() => new ScrollControllerState();
}

class ScrollControllerState extends State<ScrollControllerTestRoute> {
  ScrollController _scrollController = new ScrollController();
  bool _showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset < 1000 && _showToTopBtn) {
        setState(() {
          _showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && _showToTopBtn == false) {
        setState(() {
          _showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滚动控制'),
      ),
      body: new Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return ListTile(title: new Text('$index'));
          },
        ),
      ),
      floatingActionButton: !_showToTopBtn
          ? null
          : new FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(.0, duration: Duration(microseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
