import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpFuture extends StatefulWidget {
  @override
  _HttpFutureState createState() => _HttpFutureState();
}

class _HttpFutureState extends State<HttpFuture> {
  String showResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpFuture'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Material(
              color: Colors.blue,
              child: InkWell(
                onTap: () {
                  fetchPost().then((CommonModel model) {
                    setState(() {
                      showResult =
                          '${model.icon} + ${model.title} + ${model.statusBarColor} +${model.hideAppBar}';
                    });
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  child: Center(
                    child: Text('clickme'),
                  ),
                ),
              ),
            ),
          ),
          Text(showResult),
        ],
      ),
    );
  }

  Future<CommonModel> fetchPost() async {
    final response = await http.get(Uri.parse(
        'https://www.devio.org/io/flutter_app/json/test_common_model.json'));
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({
    required this.icon,
    required this.title,
    required this.url,
    required this.statusBarColor,
    required this.hideAppBar,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json["icon"],
      title: json["title"],
      url: json["url"],
      statusBarColor: json["statusBarColor"],
      hideAppBar: json["hideAppBar"],
    );
  }
}
