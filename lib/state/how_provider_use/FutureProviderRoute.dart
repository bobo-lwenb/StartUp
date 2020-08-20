import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FutureProviderRoute extends StatelessWidget {
  final String path = "assets/config.json";

  @override
  Widget build(BuildContext context) {
    return FutureProvider<String>(
      initialData: "loading....",
      create: (_) => loadString(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('FutureProvider'),
        ),
        body: FutureTest(),
      ),
    );
  }

  Future<String> loadString() async {
    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        return await rootBundle.loadString(path);
      },
    );
  }
}

class FutureTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${Provider.of<String>(context)}"),
    );
  }
}
