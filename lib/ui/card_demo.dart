import 'package:flutter/material.dart';

class CarsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: SizedBox(
        height: 200,
        child: Card(
          elevation: 24,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("1"),
              ),
              Divider(),
              ListTile(
                title: Text("1"),
              ),
              ListTile(
                title: Text("1"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
