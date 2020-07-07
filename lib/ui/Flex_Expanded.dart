import 'package:flutter/material.dart';

/// Flex和Expanded组合使用demo
class FlexAndExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex和Expanded'),
      ),
      body: Card(
        child: FlatButton(
          onPressed: () {
            print('clicked here');
          },
          child: Padding(
            padding: EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    '这事一些描述',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  alignment: Alignment.topLeft,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _getBottomItem(Icons.star, '1200'),
                    _getBottomItem(Icons.data_usage, '3900'),
                    _getBottomItem(Icons.account_box, '2100')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getBottomItem(IconData icon, String title) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 16.0, color: Colors.grey),
            Padding(padding: EdgeInsets.only(left: 5.0)),
            Text(
              title,
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
