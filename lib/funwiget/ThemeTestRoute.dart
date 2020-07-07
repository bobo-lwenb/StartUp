import 'package:flutter/material.dart';

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return new Theme(
      data: new ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('ThemeData'),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Icon(Icons.favorite), Icon(Icons.airport_shuttle), Text("  颜色跟随主题")],
            ),
            Theme(
              data: themeData.copyWith(iconTheme: themeData.iconTheme.copyWith(color: Colors.black)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(Icons.favorite), Icon(Icons.airport_shuttle), Text("  颜色固定黑色")]),
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.palette),
          onPressed: () =>
              setState(() => _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal),
        ),
      ),
    );
  }
}
