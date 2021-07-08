import 'package:flutter/material.dart';

class WillPopScopeDemo extends StatefulWidget {
  const WillPopScopeDemo({Key key}) : super(key: key);

  @override
  _WillPopScopeDemoState createState() => _WillPopScopeDemoState();
}

class _WillPopScopeDemoState extends State<WillPopScopeDemo> {
  bool _isLock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WillPopScope'),
      ),
      body: WillPopScope(
        onWillPop: _isLock ? () async => false : null,
        child: Center(
          child: GestureDetector(
            child: Icon(
              _isLock ? Icons.lock_outline : Icons.lock_open_outlined,
            ),
            onTap: () {
              setState(() {
                _isLock = !_isLock;
              });
            },
          ),
        ),
      ),
    );
  }
}
