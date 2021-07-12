import 'package:flutter/material.dart';
import 'package:startup_namer/http/httpdemo/HttpFuture.dart';
import 'package:startup_namer/http/httpdemo/HttpFutureBuilder.dart';

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http'),
      ),
      body: ListView(
        children: <Widget>[
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HttpFuture();
              }));
            },
            child: Text('http和Future使用'),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HttpFutureBuilder();
              }));
            },
            child: Text('http和FutureBuilder使用'),
          ),
        ],
      ),
    );
  }
}
