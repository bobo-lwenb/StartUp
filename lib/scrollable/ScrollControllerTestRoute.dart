import 'package:flutter/material.dart';

/// 滚动控制
class ScrollControllerTestRoute extends StatefulWidget {
  @override
  ScrollControllerState createState() => ScrollControllerState();
}

class ScrollControllerState extends State<ScrollControllerTestRoute> {
  ScrollController _scrollController = ScrollController(keepScrollOffset: true);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动控制'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return ListTile(title: Text('$index'));
          },
        ),
      ),
      floatingActionButton: !_showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(.0, duration: Duration(microseconds: 500), curve: Curves.ease);
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
