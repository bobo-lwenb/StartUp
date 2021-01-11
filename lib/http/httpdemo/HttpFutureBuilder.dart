import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpFutureBuilder extends StatefulWidget {
  @override
  _HttpFutureBuilderState createState() => _HttpFutureBuilderState();
}

class _HttpFutureBuilderState extends State<HttpFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpFutureBuilder'),
      ),
      body: FutureBuilder<CommonModel>(
          future: fetchPost(),
          builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Input a URL to start');
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
                return Text('');
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return Text(
                      '${snapshot.data.icon} + ${snapshot.data.title} + ${snapshot.data.statusBarColor} +${snapshot.data.hideAppBar}');
                }
                break;
              default:
                return Text('未知错误');
            }
          }),
    );
  }

  Future<CommonModel> fetchPost() async {
    final response = await http.get('https://www.devio.org/io/flutter_app/json/test_common_model.json');
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

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

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
