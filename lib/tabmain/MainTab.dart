import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:startup_namer/tabmain/DemoTab.dart';
import 'package:startup_namer/tabmain/MineTab.dart';
import 'package:startup_namer/tabmain/MyDrawer.dart';

final GlobalKey<ScaffoldState> mainTabKey = new GlobalKey<ScaffoldState>();

class MainTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int _tabIndex = 0;
  var _controller;
  DateTime? _lastPress;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainTabKey,
      drawer: MyDrawer(),
      body: WillPopScope(
        child: PageView(
          children: <Widget>[
            DemoTab(),
            MineTab(),
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        onWillPop: () async {
          if (_lastPress == null ||
              DateTime.now().difference(_lastPress!) > Duration(seconds: 1)) {
            _lastPress = DateTime.now();
            Fluttertoast.showToast(msg: 'Press again to exit');
            return false;
          } else {
            return true;
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        backgroundColor: Colors.white,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _tabIndex = index;
          });
        },
        selectedItemColor: Color(0xff333333),
        unselectedItemColor: Color(0xff999999),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart, color: Color(0xff999999)),
            activeIcon: Icon(Icons.add_shopping_cart, color: Color(0xff333333)),
            title: Text('Demo'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_friendly, color: Color(0xff999999)),
            activeIcon: Icon(Icons.child_friendly, color: Color(0xff333333)),
            title: Text('Mine'),
          )
        ],
      ),
    );
  }
}
